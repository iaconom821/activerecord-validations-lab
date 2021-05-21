class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :is_clickbait

    def is_clickbait 
        words = ["Won't Believe", "Secret", "Top ", "Guess"]

        if !title
            return
        end

        present = words.any?{|word| title.match(word)}

        if !present
            errors.add(:title, 'not "clickbaity" enough')
        end
    end

end
