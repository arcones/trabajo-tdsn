# Trabajo Final de Tratamiento Digital de Señales

### Realizado por Marta Arcones Rodríguez y Miguel González Hernández

# Pruebas fuera de tiempo real
- Para probar el programa con una señal grabada, usar el script `pruebas.m`

# Programa en tiempo real
Una vez mapeado el micrófono, el programa en tiempo real se ejecuta con el script `main.m`.
Si todo es correcto, mostrará varias gráficas que iran cambiando en función de la señal de entrada.

# Implementación
El programa crea y aplica tres filtros elípticos, paso bajo, paso banda y paso alto a las frecuencias de la señal de entrada.
Se muestra en tiempo real por pantalla:
 - La transformada de Fourier de la señal de entrada.
 - Un gráfico de barras que muestra los porcentajes de señal que ha dejado pasar cada filtro.

