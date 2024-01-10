% Cambiar las rutas de las librerias por si no son iguales
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Nifti' );
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Vtk' );

% Cargamos los .mat de los jacobianos
datos1 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\region_ventriculo_AD_voxelmorph.mat' );
datos2 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\region_ventriculo_CN_voxelmorph.mat' );
datos3 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\region_ventriculo_MCI_voxelmorph.mat' );
datos4 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\porcentajeNegJac_voxelmorph_ventriculo.mat' );

lista_jacobianos_AD = datos1.voxelmorph_ventriculo_AD;
lista_jacobianos_CN = datos2.voxelmorph_ventriculo_CN;
lista_jacobianos_MCI = datos3.voxelmorph_ventriculo_MCI;

lista_regiones_neg_CN = datos4.regiones_negativas_CN;
lista_regiones_neg_AD = datos4.regiones_negativas_AD;
lista_regiones_neg_MCI = datos4.regiones_negativas_MCI;
porcentaje_neg_CN = datos4.porcentajes_negativos_CN;
porcentaje_neg_AD = datos4.porcentajes_negativos_AD;
porcentaje_neg_MCI = datos4.porcentajes_negativos_MCI;

% mostrar el procentaje de negativos
format long;
disp(porcentaje_neg_CN);
disp(porcentaje_neg_AD);
disp(porcentaje_neg_MCI);

% mostramos el mapa jacobiano destacando las zonas negativas de una imagen
% CN y otra AD
valor1 = lista_jacobianos_CN{31};
valor1 = valor1.img;

valor2 = lista_jacobianos_AD{39};
valor2 = valor2.img;

valor3 = lista_jacobianos_MCI{45};
valor3 = valor3.img;

region1 = lista_regiones_neg_CN{31};
region2 = lista_regiones_neg_AD{39};
region3 = lista_regiones_neg_MCI{45};

filas1 = region1(:, 1);
columnas1 = region1(:, 2);
profundidades1 = region1(:, 3);

filas2 = region2(:, 1);
columnas2 = region2(:, 2);
profundidades2 = region2(:, 3);

filas3 = region3(:, 1);
columnas3 = region3(:, 2);
profundidades3 = region3(:, 3);

% Crear una máscara para resaltar las regiones negativas
mask1 = zeros(size(valor1));
mask1(sub2ind(size(valor1), filas1, columnas1, profundidades1)) = 1;

% Aplicar la máscara a la imagen original
imagen_resaltada1 = valor1;
imagen_resaltada1(logical(mask1)) = max(valor1(:)); % Asignar el valor maximo en las regiones negativas

% Crear una máscara para resaltar las regiones negativas
mask2 = zeros(size(valor2));
mask2(sub2ind(size(valor2), filas2, columnas2, profundidades2)) = 1;

% Aplicar la máscara a la imagen original
imagen_resaltada2 = valor2;
imagen_resaltada2(logical(mask2)) = max(valor2(:)); % Asignar el valor maximo en las regiones negativas

% Crear una máscara para resaltar las regiones negativas
mask3 = zeros(size(valor3));
mask3(sub2ind(size(valor3), filas3, columnas3, profundidades3)) = 1;

% Aplicar la máscara a la imagen original
imagen_resaltada3 = valor3;
imagen_resaltada3(logical(mask3)) = max(valor3(:)); % Asignar el valor minimo en las regiones negativas

% Visualizar la imagen original y las regiones negativas resaltadas
view_nii(make_nii(valor1)); % Visualizar la imagen original CN
view_nii(make_nii(valor2)); % Visualizar la imagen original AD
view_nii(make_nii(valor3)); % Visualizar la imagen original MCI

view_nii(make_nii(imagen_resaltada1)); % Visualizar la imagen con las regiones negativas resaltadas CN
view_nii(make_nii(imagen_resaltada2)); % Visualizar la imagen con las regiones negativas resaltadas AD
view_nii(make_nii(imagen_resaltada3)); % Visualizar la imagen con las regiones negativas resaltadas MCI



