class Post < ActiveRecord::Base
  belongs_to :author
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait_title

  def clickbait_title
    if title
      check = ["Won't Believe", "Secret", "Top", "Guess"].any? do |clickbait|
        title.include?(clickbait)
      end

      if check == false
        errors.add(:title, "title is not clickbaity enough!")
      end
    end
  end



  # def clickbait_title
  #   # binding.pry
  #   output = false
  #   if title
  #     ["Won't Believe", "Secret", "Top", "Guess"].each do |clickbait|
  #       if title.include?(clickbait)
  #         output = true
  #       end
  #     end
  #   end
  #   if output == false
  #     errors.add(:title, "title is not clickbaity enough!")
  #   end
  # end

end
