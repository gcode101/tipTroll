class Professional < ActiveRecord::Base

  has_secure_password

  # EMAIL_REGEX = /\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\z/
  # validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  # validates :email, :presence => true, :uniqueness => true, format: { with: EMAIL_REGEX }
  # validates :password, :confirmation => true #password_confirmation attr
  # validates_length_of :password, :in => 6..20, :on => :create


	has_many :cust_ratings
	has_many :pro_ratings, dependent: :destroy

	def average_rating(incoming_score)
    if pro_ratings[0].score == 0
      self.update(rating_score: incoming_score)
      incoming_score
    else
      current_ave = pro_ratings[0].score
      summation = current_ave + incoming_score.to_i
      results = summation / 2
      self.update(rating_score: results)
      results
    end
	end

  def self.search(zip_code, profession)
    results_a = []
    results_b = []
    final_results = []

    if zip_code && profession
     results_a = self.where('job_location LIKE ?', "%#{zip_code}%")
     results_b = self.where('job_title LIKE ?', "%#{profession}%")


     results_a.each do |a_list|
      results_b.each do |b_list|

        if a_list == b_list
          final_results << a_list
        end
      end
     end
    else
      return "Please enter something in the search box."
    end
    p "i made it to the end"
    p final_results
    final_results
  end

end
