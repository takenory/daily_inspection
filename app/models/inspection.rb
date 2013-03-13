# -*- coding: utf-8 -*-
# Inspectionsテーブルのモデル。
class Inspection < ActiveRecord::Base
  has_many :checks

  attr_accessible :staff_code, :updated_at

  validates_presence_of :staff_code, :on => :update
  validates_format_of :staff_code, :with => /\A[a-zA-Z0-9]{7}\Z/, :on => :update, :allow_blank => true, 
                      :message => I18n.t("activerecord.errors.messages.wrong_length_with_half_width_char_and_num", :count => 7)

  validate :does_not_have_invalid_result

  # 点検を最終的に保存する。
  # ・点検者氏名コードを更新する。
  # ・点検結果の対応者氏名コードを更新する。
  # ・点検内容（マスタ）の点検予定日を更新する。
  # === 引き数
  # *inspection*:: 点検を格納する配列（Inspectionsテーブルのカラムを有するハッシュを指定すること）
  # === 戻り値
  # *true* 保存に成功した場合 / *false* 保存に失敗した場合
  def finish(inspection)
    self.transaction do
      self.update_attributes!(inspection)
      begin
        self.checks.each do |check|
          check.result.set_staff_code!
          check.update_master_schedule!
        end
      rescue => e
        self.errors.add :base, e.message
        raise e
      end
    end
    return true
  rescue
    return false
  end

private
  # 点検結果の内容を検証する。
  # ・点検結果テーブルにレコードが存在するか。
  # ・点検結果レコードは妥当なデータか（Resultモデルの検証が通るデータか）。
  # === 引き数
  # なし
  # === 戻り値
  # なし
  def does_not_have_invalid_result
    unless self.id.blank?
      Check.includes(:result)
           .where('inspection_id = ?', self.id)
           .order('checks.sequence').all.each_with_index do |check, index|
        if check.result
          errors.add :base, :check_result_was_invalid, :num => (index + 1) unless check.result.valid?
        else
           errors.add :base, :has_not_been_checked, :num => (index + 1)
        end
      end
    end
  end
end
