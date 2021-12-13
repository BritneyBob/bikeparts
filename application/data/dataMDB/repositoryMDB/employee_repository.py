from application.data.db import session
from application.data.models import Employee


def create_employee(employee):
    employee = Employee(**employee)
    session.add(employee)
    session.commit()
