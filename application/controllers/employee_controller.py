from application.data.repository import employee_repository


def create_employee(employee):
    employee_repository.create_employee(employee)
