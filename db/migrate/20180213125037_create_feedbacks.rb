class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.string :feedback_type
      t.string :feedback_subject
      t.string :feedback_email
      t.string :feedback_mno
      t.string :feedback_comment

      t.timestamps
    end
  end
end
