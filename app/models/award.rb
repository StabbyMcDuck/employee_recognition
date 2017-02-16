class Award < ApplicationRecord
  # associations

  belongs_to :employee,
             class_name: "User"

  belongs_to :granter,
             class_name: "User"

  # callbacks

  before_validation :denormalize_employee

  # validations

  validates :employee_email,
            presence: true
  validates :employee_name,
            presence: true
  validates :granter,
            presence: true

  # methods

  private

  def denormalize_employee
    if employee
      self.employee_email = employee.email
      self.employee_name = employee.name
    end
  end
end
