# Trabajo Final de Tratamiento Digital de Señales

### Realizado por Marta Arcones Rodríguez y Miguel González Hernández

# Pruebas fuera de tiempo real
Se puede probar el programa fuera de tiempo real corriendo el script `pruebas.m`, que utiliza una señal grabada incluida en el proyecto.

# Programa en tiempo real
Una vez mapeado el micrófono, el programa en tiempo real se ejecuta corriendo la primera sección del script contenido en el fichero `main.m`.
Para parar el programa, se deberá ejecutar la segunda y última sección del fichero `main.m`.

Si todo es correcto, durante la ejeccución, se mostraran varias representaciones que iran cambiando en función de la señal de entrada.

# Implementación
El programa crea y aplica tres filtros elípticos, paso bajo, paso banda y paso alto a las frecuencias de la señal de entrada.
Además el programa calcula que porcentaje de la señal es paso bajo, banda y alto.
Se muestra en tiempo real por pantalla:
 - La transformada de Fourier de las salidas de los filtros aplicados en tiempo real paso bajo, paso banda, paso alto y paso todo.
 - Un gráfico de barras que muestra los porcentajes de señal que ha dejado pasar cada filtro. Además el programa comprueba en tiempo real que los porcentajes son coherentes, elevando una excepción si alguno de los porcentajes supera el 100%.
