function [porcentaje] = hallarPorcentaje(array)

contador = 0;

for n = 1 : length(array)
   if array(n) == 1
       contador =  contador + 1;
   end
end

porcentaje = contador/length(array)*100;