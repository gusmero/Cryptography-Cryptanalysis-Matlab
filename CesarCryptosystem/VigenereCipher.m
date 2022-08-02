
function plaint_text = vigenereEncryption()

 alphabet =['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];

plain_text = input('Enter a text (plaintext) that you wish to encrypt it (eliminate the spaces): ','s');
plaint_text_length = length(plain_text);

key = input('Enter a key that you wish to use to encrypt the message: ','s');
key_length = length(key);

if key_length < plaint_text_length
    key = strcat(key, key(1,(plaint_text_length - key_length)) );
    key_length = length(key);
else
    plaint_text= strcat( plain_text , plain_text(1,key_length - plaint_text_length));
    plaint_text_length = length(plain_text);
end


for i=1:key_length
    plaint_text(i)= alphabet(mod(   (strfind(alphabet , plain_text(i)) + strfind(alphabet , key(i)) ) , 26 )+1);
end


end