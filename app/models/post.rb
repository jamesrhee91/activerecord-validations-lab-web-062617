class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if /Won't Believe|Secret|Top \d|Guess/.match(value).nil?
      record.errors[attribute] << "is not a valid title"
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true, title: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-fiction"]}

end
