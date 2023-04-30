clear all
imagine_initiala=imread('C:\Users\Maftei Silviu\Desktop\Romania-Mare.jpg');
binary_sentence=imagine_initiala(:)';
binary_sentence=dec2bin(binary_sentence)';
binary_sentence=binary_sentence(:)';

im_canal=reshape(binary_sentence,8,[])';
im_canal=bin2dec(im_canal);
im_canal=uint8(im_canal);
im_canal=reshape(im_canal,578,800,3);
imshow(im_canal)