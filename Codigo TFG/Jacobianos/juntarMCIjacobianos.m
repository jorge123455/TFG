% Cambiar las rutas de las librerias por si no son iguales
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Nifti' );
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Vtk' );

datos1 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\imagenes_y_media_voxelmorphMCI1.mat' );
datos2 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\imagenes_y_media_voxelmorphMCI2.mat' );

jac1 = datos1.jacobianos_MCI;
jac2 = datos2.jacobianos_MCI;
suma1 = datos1.suma_imagenes;
suma2 = datos2.suma_imagenes;

jacobianos_MCI = cell(1, 286);

for i = 1:160
    jacobiano = jac1{i};

    jacobianos_MCI{i} = jacobiano;
end

for i = 1:126
    jacobiano = jac2{i};

    jacobianos_MCI{i + 160} = jacobiano;
end

suma_imagenes = suma1 + suma2;
media_jacobianos_MCI = suma_imagenes / 286;

% Guardar el arreglo y la media en un archivo .mat
save('imagenes_y_media_voxelmorphMCI.mat', 'jacobianos_MCI', 'media_jacobianos_MCI', '-v7.3');