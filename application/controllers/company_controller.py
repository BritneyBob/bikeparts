from application.data.repository import company_repository


def create_company(company):
    company_repository.create_company(company)
