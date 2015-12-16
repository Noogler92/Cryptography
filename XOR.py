
import os, binascii
message = "We will meet at dawn"
key = "this is a key"


def xor_encrypt(array,key_l):
    m_l = conmvertToList(array)
    #key_l = keyToList(key,message)
    a = [ m_l[i]^ key_l[i] for i in range(0, len(m_l) ) ]

    a = [chr( a[i]) for i in range(0,len(key_l)) ]
    #print(a)
    xor = ''.join(a)
    return xor

def conmvertToList(string):
     l = [ord(i) for i in string]

     return l

def keyToList(key, message):
    k = conmvertToList(key)
    if len(k) < len(message):
       for i in range(len(k), len(message)):
            k.append(ord(os.urandom(1))  )
    return k

def main():



   # print("Message: ", m_l)
    #print("Key_l: ", key_l)
    k = keyToList(key,message)
    encrypted_message= xor_encrypt(message,k)
    m = xor_encrypt(encrypted_message,k)

    print( encrypted_message)
    print("Key: ",key)
    print(m)


if __name__ == '__main__':
    main()