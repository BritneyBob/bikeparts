import datetime

today = datetime.datetime.now()
later = today + datetime.timedelta(days=5)
print(later)