% Cambiar las rutas de las librerias por si no son iguales
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Nifti' );
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Vtk' );

% Cargamos los .mat de los jacobianos
datos1 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\jacobianosYmediaCN.mat' );
datos2 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\jacobianosYmediaAD.mat' );
datos3 = load('C:\Users\Usuario\Desktop\TFG\matlab\Scripts\porcentajeNegJac.mat');

lista_jacobianos_CN = datos1.jacobianos_CN;
lista_jacobianos_AD = datos2.jacobianos_AD;
media_jacobianos_CN = datos1.media_jacobianos_CN;
media_jacobianos_AD = datos2.media_jacobianos_AD;

lista_regiones_neg_CN = datos3.regiones_negativas_CN;
lista_regiones_neg_AD = datos3.regiones_negativas_AD;
porcentaje_neg_CN = datos3.porcentajes_negativos_CN;
porcentaje_neg_AD = datos3.porcentajes_negativos_AD;

% mostrar el procentaje de negativos
disp(porcentaje_neg_CN);
disp(porcentaje_neg_AD);

% mostramos el mapa jacobiano destacando las zonas negativas de una imagen
% CN y otra AD
valor1 = lista_jacobianos_CN{6};
valor1 = valor1.img;

valor2 = lista_jacobianos_AD{25};
valor2 = valor2.img;

region1 = lista_regiones_neg_CN{6};
region2 = lista_regiones_neg_AD{25};

filas1 = region1(:, 1);
columnas1 = region1(:, 2);
profundidades1 = region1(:, 3);

filas2 = region2(:, 1);
columnas2 = region2(:, 2);
profundidades2 = region2(:, 3);

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

% Visualizar la imagen original y las regiones negativas resaltadas
view_nii(make_nii(valor1)); % Visualizar la imagen original CN
view_nii(make_nii(valor2)); % Visualizar la imagen original AD

view_nii(make_nii(imagen_resaltada1)); % Visualizar la imagen con las regiones negativas resaltadas CN
view_nii(make_nii(imagen_resaltada2)); % Visualizar la imagen con las regiones negativas resaltadas AD


