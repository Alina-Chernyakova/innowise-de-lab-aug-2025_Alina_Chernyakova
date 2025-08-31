#Task 4. List comprehension и словари 

words = ["hello", "world", "python", "code"]

len_list=[len(i) for i in words]# Создать список длин слов, используя списковое включение 
print(len_list)

big_list=[ i for i in words # Создать список слов длиннее 4 символов
          if len(i)>4]
print(big_list)

words_dict={words[i]: len_list[i] for i in range(len(words))} #Создать словарь: {слово: длина} для всех слов. Использовала генератор как для списков, только со словарем
print(words_dict)
#можно было создать словарь с помощью dict и zip
# words_dict=dict(zip(words, len_list))