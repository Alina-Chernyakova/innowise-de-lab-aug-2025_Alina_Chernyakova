#Task 1.2.  Методы строк и форматинг
email = " USER@DOMAIN.COM "
clean_email= email.strip()
form_email=clean_email.lower()
print(form_email) # Очистить и отформатировать до вида: "user@domain.com" 
email_list=form_email.split('@')# Разделить на имя пользователя и домен. Метод split разделяет строку и составляет список
user=email_list[0]  # берем первый элемент списка
domain=email_list[1] # берем второй элемент списка
print(f"Username: {user}, Domain: {domain}")