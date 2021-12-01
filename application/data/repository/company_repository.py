from application.data.db import session
from application.data.models import Company


def create_company(company):
    company = Company(**company)
    session.add(company)
    session.commit()
