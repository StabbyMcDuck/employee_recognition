class Award < ApplicationRecord
  # associations
  
  belongs_to :employee,
             class_name: "User"

  belongs_to :granter,
             autosave: true,
             class_name: "User"

  VALID_AWARDS = ["Employee of the Month", "Employee of the Year", "Kudos"].freeze

  def self.get_awards
    return VALID_AWARDS
  end

  #for generating csv file
  def self.to_csv
    attributes = %w{id award_type employee_name employee_email grant_date}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |award|
        csv << award.attributes.values_at(*attributes)
      end
    end
  end


  # callbacks

  before_validation :denormalize_employee

  # validations

  validates :employee_email,
            presence: true
  validates :employee_name,
            presence: true
  validates :granter,
            presence: true
  validates :grant_date,
            presence: true
  validates :signature,
            presence: true

  # methods

  def signature
    granter&.signature
  end

  private

  def denormalize_employee
    if employee
      self.employee_email = employee.email
      self.employee_name = employee.name
    end
  end
end
