from application.data.repository import company_repository


def create_company(company):
    company_repository.create_company(company)


def create_company_address(company, address):
    company_repository.create_company_address(company, address)


# def get_companies():
#     company_repository.get_companies()
