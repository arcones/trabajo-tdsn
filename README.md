# Trabajo Final de Tratamiento Digital de Señales

### Realizado por Marta Arcones Rodríguez y Miguel González Hernández

# Pruebas
- Para probar que MATLAB reconoce correctamente el micrófono, usar el script `pruebaHW.m`
- Para probar el programa con una señal grabada, usar el script `test.m`

# Programa en tiempo real
Una vez mapeado el micrófono, el programa en tiempo real se ejecuta con el script `main.m`.
Si todo es correcto, mostrará un gráfico que irá cambiando en función de la distribución de frecuencias de la señal de entrada.

# Implementación
El programa ejecuta tres filtros, `lowpass`, `bandpass` y `higpass` para filtrar las frecuencias de la señal de entrada.
El gráfico muestra los porcentajes de señal que ha dejado pasar cada filtro. 

