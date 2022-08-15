Historial5 = (8520, 9510, 7530, 3570, 1590)

def totoMax (historial):
    max = historial[0]
    for i in range(len(historial)):
        if historial[i]>max:
            max= historial[i]
    return max
    
print(totoMax(Historial5))