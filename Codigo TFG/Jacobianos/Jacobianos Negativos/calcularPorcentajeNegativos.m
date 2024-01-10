% Cambiar las rutas de las librerias por si no son iguales
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Nifti' );
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Vtk' );

% Cargamos los .mat de los jacobianos
datos1 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\region_ventriculo_AD_voxelmorph.mat' );
datos2 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\region_ventriculo_CN_voxelmorph.mat' );
datos3 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\region_ventriculo_MCI_voxelmorph.mat' );

lista_jacobianos_AD = datos1.voxelmorph_ventriculo_AD;
lista_jacobianos_CN = datos2.voxelmorph_ventriculo_CN;
lista_jacobianos_MCI = datos3.voxelmorph_ventriculo_MCI;

% Calcular el porcentaje de valores negativos en cada imagen 3D
porcentajes_negativos_AD = zeros(194, 1);
regiones_negativas_AD = cell(194, 1);

for i = 1:194
    imagen_3D = lista_jacobianos_AD{i};
    imagen_3D = imagen_3D.img;

    % Calcular el porcentaje de valores negativos
    format long;
    porcentaje_negativos = sum(imagen_3D(:) < 0) / numel(imagen_3D) * 100;
    porcentajes_negativos_AD(i) = single(porcentaje_negativos);

    % Obtener las coordenadas de los píxeles con valores negativos
    [filas, columnas, profundidades] = ind2sub(size(imagen_3D), find(imagen_3D < 0));
    
    % Almacenar las coordenadas como regiones en la imagen
    regiones = [filas, columnas, profundidades];
    regiones_negativas_AD{i} = single(regiones);
end

% Calcular el porcentaje de valores negativos en cada imagen 3D
porcentajes_negativos_CN = zeros(229, 1);
regiones_negativas_CN = cell(229, 1);

for i = 1:229
    imagen_3D = lista_jacobianos_CN{i};
    imagen_3D = imagen_3D.img;

    % Calcular el porcentaje de valores negativos
    format long;
    porcentaje_negativos = sum(imagen_3D(:) < 0) / numel(imagen_3D) * 100;
    porcentajes_negativos_CN(i) = single(porcentaje_negativos);

    % Obtener las coordenadas de los píxeles con valores negativos
    [filas, columnas, profundidades] = ind2sub(size(imagen_3D), find(imagen_3D < 0));
    
    % Almacenar las coordenadas como regiones en la imagen
    regiones = [filas, columnas, profundidades];
    regiones_negativas_CN{i} = single(regiones);
end

% Calcular el porcentaje de valores negativos en cada imagen 3D
porcentajes_negativos_MCI = zeros(284, 1);
regiones_negativas_MCI = cell(284, 1);

for i = 1:284
    imagen_3D = lista_jacobianos_MCI{i};
    imagen_3D = imagen_3D.img;

    % Calcular el porcentaje de valores negativos
    format long;
    porcentaje_negativos = sum(imagen_3D(:) < 0) / numel(imagen_3D) * 100;
    porcentajes_negativos_MCI(i) = single(porcentaje_negativos);

    % Obtener las coordenadas de los píxeles con valores negativos
    [filas, columnas, profundidades] = ind2sub(size(imagen_3D), find(imagen_3D < 0));
    
    % Almacenar las coordenadas como regiones en la imagen
    regiones = [filas, columnas, profundidades];
    regiones_negativas_MCI{i} = single(regiones);
end

porcentajes_negativos_AD = single(porcentajes_negativos_AD);
porcentajes_negativos_CN = single(porcentajes_negativos_CN);
porcentajes_negativos_MCI = single(porcentajes_negativos_MCI);

disp(porcentajes_negativos_AD);
disp(porcentajes_negativos_CN);
disp(porcentajes_negativos_MCI);

disp(regiones_negativas_AD);
disp(regiones_negativas_CN);
disp(regiones_negativas_MCI);

save('porcentajeNegJac_voxelmorph_ventriculo.mat', 'regiones_negativas_AD', 'porcentajes_negativos_AD', 'regiones_negativas_CN', 'porcentajes_negativos_CN', 'regiones_negativas_MCI', 'porcentajes_negativos_MCI' );