#Task 2.  Функции с параметрами 

prices = [1000, 3499, 250] 
nds = 0.20

def add_vat(prices,nds):
    total=[]
    for i in range(len(prices)):
       total.append(prices[i]+prices[i]*nds) #добавим в новый список обновленные элементы
    #print(total) если просто печатать результат, то вызов функции будет таким : add_vat(prices,nds)
    return total #вернем список

new_prices=add_vat(prices, nds)
print(f"Новые цены: {new_prices}")