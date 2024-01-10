% Cambiar las rutas de las librerias por si no son iguales
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Nifti' );
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Vtk' );

% Cargamos los .mat de los jacobianos
datos1 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\jacobianosYmediaCNexf.mat' );
datos2 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\jacobianosYmediaCN.mat' );

lista_jacobianos_CN = datos1.jacobianos_CN;
lista_jacobianos_AD = datos2.jacobianos_CN;

size(lista_jacobianos_CN);

media_jacobianos_CN = datos1.media_jacobianos_CN;
media_jacobianos_AD = datos2.media_jacobianos_CN;

% Mostrar una imagen cualquiera del array de 40 imagenes
valor = lista_jacobianos_CN{1};
valor = valor.img;
size(valor);

valor_nii = make_nii(valor);  
view_nii( valor_nii );

valor1 = lista_jacobianos_AD{1};
valor1 = valor1.img;
size(valor1);

valor_nii1 = make_nii(valor1);  
view_nii( valor_nii1 );

% Mostrar las imagenes medias

% media_CN_nii = make_nii(media_jacobianos_CN);
% media_AD_nii = make_nii(media_jacobianos_AD);
% 
% view_nii( media_CN_nii );
% view_nii( media_AD_nii );
