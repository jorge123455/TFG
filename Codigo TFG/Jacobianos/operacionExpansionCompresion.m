% Cambiar las rutas de las librerias por si no son iguales
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Nifti' );
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Vtk' );

datos1 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\jacobianosYmediaCN_LapIRN.mat' );
datos2 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\jacobianosYmediaAD_LapIRN.mat' );

lista_jacobianos_CN = datos1.jacobianos_CN;
lista_jacobianos_AD = datos2.jacobianos_AD;
media_jacobianos_CN = datos1.media_jacobianos_CN;
media_jacobianos_AD = datos2.media_jacobianos_AD;

% valor = lista_jacobianos_CN{1}.img;
% 
% suma_imagenes = zeros(size(valor)); % Inicializar la suma
% for i = 1:229
%     suma_imagenes = suma_imagenes + lista_jacobianos_CN{i}.img;
% end
% media_jacobianos_CN = suma_imagenes / 229;
% 
% suma_imagenes = zeros(size(valor)); % Inicializar la suma
% for i = 1:194
%     suma_imagenes = suma_imagenes + lista_jacobianos_AD{i}.img;
% end
% media_jacobianos_AD = suma_imagenes / 194;

resta = media_jacobianos_AD - media_jacobianos_CN;
divison = resta./media_jacobianos_CN;

figura2_40_LapIRN = make_nii(divison);

save('figura2_40_LapIRN.mat', 'figura2_40_LapIRN');

view_nii( figura2_40_LapIRN );

