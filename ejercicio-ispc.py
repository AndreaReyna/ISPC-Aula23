# 2   Crear una lista en Python denominada “Dueno2”  y recorrerla con un bucle  mostrando sus elementos por pantalla con excepción del DNI y el apellido. 
# Los elementos de la lista son:
#            23546987,  “Maria”,  “Perez”, 4789689,  “Pueyrredon  811”
# que representan los datos del dueño de un perro (DNI, nombre, apellido, teléfono y dirección) 

from ast import For, If


print("Los datos registrados son : ")
print('Nombre , Telefono , Direccion')
dueno2 =[23546987,'María','Perez',4789689,'Pueyrredon 811' ]
for i in dueno2:
    if i!=dueno2[0] and i!=dueno2[2]:    
        print(i)   
 
