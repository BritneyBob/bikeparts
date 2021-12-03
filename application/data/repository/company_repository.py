from application.data.db import session
from application.data.models import Company, companies_has_addresses_table


def create_company(company):
    company = Company(**company)
    session.add(company)
    session.commit()


def create_company_address(company, address):
    statement = companies_has_addresses_table.insert().values(company_id=company, address_id=address)
    session.execute(statement)
    session.commit()
