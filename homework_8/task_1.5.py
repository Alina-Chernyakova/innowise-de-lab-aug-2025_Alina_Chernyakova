#Task 5. Дан список чисел nums и целевое число target. Найти индексы двух чисел, сумма 
#которых равна target.

nums = [2, 7, 11, 15, 11]
target = 9

index=[] #пройдемся вложенными циклами
for i in range(len(nums)): # будем смотреть i-тый элемент и следующий за ним и проверять
    for j in range(i+1,len(nums)):
        if nums[i]+nums[j]==target:
            index=[i,j]
            break #если находим, то выходим из цикла
    break # выходим окончательно
print(index)