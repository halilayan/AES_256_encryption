s_box_table = [
    # 0    1    2     3     4     5     6     7     8     9     a     b     c     d     e     f
    0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76, # 0
    0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0, # 1
    0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15, # 2
    0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75, # 3
    0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84, # 4
    0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf, # 5
    0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8, # 6
    0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2, # 7
    0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73, # 8
    0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb, # 9
    0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79, # a
    0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08, # b
    0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a, # c
    0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e, # d
    0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf, # e
    0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16  # f
]

R_Con = [0x00, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40]

#--__--__--__--__XOR__--__--__--__(burada xor lamak istediğimiz işlemler için kullanabiliriz)
def xor (a, b):
    xor_result = (a ^ b)
    return xor_result

def select(a,row,column):  #s_box içerisindeki değerlerin karşılığını 4x4 matrixe almak için kullanıyoruz
    shift1 = 3 - column
    shift2 = 3 - row
    return((a>>(shift1*32 + shift2*8))%2**8)

def select2(a,row,column): #s_box içerisindeki değerlerin karşılığını 
    shift1 = 7 - column
    shift2 = 3 - row
    return((a>>(shift1*32 + shift2*8))%2**8)


#__--__--__--__SUBBYTES__--__--__--__
def subbytes(xor_result):
    output = 0
    for i in range(4):
        for j in range(4):
            bolme = (select(xor_result,j,i)) 
            sb_box_bolunmus = s_box_table [bolme]
            output = (output << 8) + sb_box_bolunmus  
    return output      

#__--__--__--__SHIFTROWS__--__--__--__
def ShiftRows(state_in):
    state_out = select(state_in,0,0)
    state_out = (state_out << 8) + select(state_in,1,1)
    state_out = (state_out << 8) + select(state_in,2,2)
    state_out = (state_out << 8) + select(state_in,3,3)
    state_out = (state_out << 8) + select(state_in,0,1)
    state_out = (state_out << 8) + select(state_in,1,2)
    state_out = (state_out << 8) + select(state_in,2,3)
    state_out = (state_out << 8) + select(state_in,3,0)
    state_out = (state_out << 8) + select(state_in,0,2)
    state_out = (state_out << 8) + select(state_in,1,3)
    state_out = (state_out << 8) + select(state_in,2,0)
    state_out = (state_out << 8) + select(state_in,3,1)
    state_out = (state_out << 8) + select(state_in,0,3)
    state_out = (state_out << 8) + select(state_in,1,0)
    state_out = (state_out << 8) + select(state_in,2,1)
    state_out = (state_out << 8) + select(state_in,3,2)
    return state_out

#__--__--__--__MIXCOLUMNS(gf)__--__--__--__
def mult2(din):
    if((din>>7) % 2 == 1):   
        dout = (din << 1) ^ 0x11b
    else:
        dout = din << 1
    return dout

def mult3(din):
    if((din>>7) % 2 == 1):   
        dout = (din << 1) ^ din ^ 0x11b
    else:
        dout = (din << 1) ^ din
    return dout

def mixcolums (state_in):
    state_out = 0
    
    for i in range(4):
        state_out = (state_out << 8) + ((mult2(select(state_in, 0, i)) ^ (mult3(select(state_in, 1, i))) ^ (select(state_in, 2, i)) ^ (select(state_in, 3, i))))
        state_out = (state_out << 8) + ((select(state_in, 0, i))) ^ (mult2(select(state_in, 1, i))) ^ (mult3(select(state_in, 2, i))) ^ (select(state_in, 3, i))
        state_out = (state_out << 8) + ((select(state_in, 0, i)) ^ (select(state_in, 1, i)) ^ (mult2(select(state_in, 2, i))) ^ (mult3(select(state_in, 3, i)))) 
        state_out = (state_out << 8) + ((mult3(select(state_in, 0, i))) ^ (select(state_in, 1, i)) ^ (select(state_in, 2, i)) ^ (mult2(select(state_in, 3, i)))) 
    return state_out

def key_expansion(state_in,a):
    state_out = s_box_table[select2(state_in, 1, 7)]
    state_out = (state_out << 8) + s_box_table[(select2(state_in, 2, 7))]
    state_out = (state_out << 8) + s_box_table[(select2(state_in, 3, 7))]
    state_out = (state_out << 8) + s_box_table[(select2(state_in, 0, 7))]   
   
    columnwi_7 = select2(state_in, 0, 0)
    columnwi_7 = (columnwi_7 << 8) + select2(state_in, 1, 0)
    columnwi_7 = (columnwi_7 << 8) + select2(state_in, 2, 0)
    columnwi_7 = (columnwi_7 << 8) + select2(state_in, 3, 0)
    
    rcon_call = 0
    rcon_call = R_Con[a]
    rcon_call = (rcon_call << 24)
    
    first_a1 = state_out ^ columnwi_7 ^ rcon_call
#---___---___ ---___---___---___---___ ---___---___  ---___---___ 
    columnwi_6 = select2(state_in,0, 1)
    columnwi_6 = (columnwi_6 << 8) + select2(state_in, 1, 1)
    columnwi_6 = (columnwi_6 << 8) + select2(state_in, 2, 1)
    columnwi_6 = (columnwi_6 << 8) + select2(state_in, 3, 1)
    
    second_a2 = columnwi_6 ^ first_a1
#---___---___ ---___---___---___---___ ---___---___  ---___---___     
    columnwi_5 = select2(state_in,0, 2)
    columnwi_5 = (columnwi_5 << 8) + select2(state_in, 1, 2)
    columnwi_5 = (columnwi_5 << 8) + select2(state_in, 2, 2)
    columnwi_5 = (columnwi_5 << 8) + select2(state_in, 3, 2)
    
    third_a3 = columnwi_5 ^ second_a2
#---___---___ ---___---___---___---___ ---___---___  ---___---___     
    columnwi_4 = select2(state_in, 0, 3)
    columnwi_4 = (columnwi_4 << 8) + select2(state_in, 1, 3)
    columnwi_4 = (columnwi_4 << 8) + select2(state_in, 2, 3)
    columnwi_4 = (columnwi_4 << 8) + select2(state_in, 3, 3)
    
    fourth_a4 = columnwi_4 ^ third_a3
#---___---___ ---___---___---___---___ ---___---___  ---___---___ 
            
    #anahtarı ikinci kez s_boxtan değiştir 
    state_out = s_box_table[select2(fourth_a4, 0, 7)]
    state_out = (state_out << 8) + s_box_table[(select2(fourth_a4, 1, 7))]
    state_out = (state_out << 8) + s_box_table[(select2(fourth_a4, 2, 7))]
    state_out = (state_out << 8) + s_box_table[(select2(fourth_a4, 3, 7))]     

    columnwi_3 = select2(state_in, 0, 4)
    columnwi_3 = (columnwi_3 << 8) + select2(state_in, 1, 4)
    columnwi_3 = (columnwi_3 << 8) + select2(state_in, 2, 4)
    columnwi_3 = (columnwi_3 << 8) + select2(state_in, 3, 4)
    
    fifth_a5 = columnwi_3 ^ state_out
#---___---___ ---___---___---___---___ ---___---___  ---___---___    
    columnwi_2 = select2(state_in, 0, 5)
    columnwi_2 = (columnwi_2 << 8) + select2(state_in, 1, 5)
    columnwi_2 = (columnwi_2 << 8) + select2(state_in, 2, 5)
    columnwi_2 = (columnwi_2 << 8) + select2(state_in, 3, 5)

    sixth_a6 = columnwi_2 ^ fifth_a5
#---___---___ ---___---___---___---___ ---___---___  ---___---___     

    columnwi_1 = select2(state_in, 0, 6)
    columnwi_1 = (columnwi_1 << 8) + select2(state_in, 1, 6)
    columnwi_1 = (columnwi_1 << 8) + select2(state_in, 2, 6)
    columnwi_1 = (columnwi_1 << 8) + select2(state_in, 3, 6)
    
    seventh_a2 = columnwi_1 ^ sixth_a6
   #---___---___ ---___---___---___---___ ---___---___  ---___---___ 

    columnwi_0 = select2(state_in, 0, 7)
    columnwi_0 = (columnwi_0 << 8) + select2(state_in, 1, 7)
    columnwi_0 = (columnwi_0 << 8) + select2(state_in, 2, 7)
    columnwi_0 = (columnwi_0 << 8) + select2(state_in, 3, 7)

    eighth_a8 = columnwi_0 ^ seventh_a2
    final = (first_a1 << 224) + (second_a2 << 192) + ( third_a3 << 160) + (fourth_a4 << 128) + (fifth_a5 << 96) + (sixth_a6 << 64) + (seventh_a2 << 32) + (eighth_a8)
    
    return final    

def aes(plain_text, key):
    plain_text   = plain_text
    key          = key

    key1 = (key >> 128) 
    a=key1
    key_round = 0
    print("round0_input",(hex(plain_text)))
    print("round0_k_sch", (hex(a)))

    for i in range(1, 15):
        xor_result = xor(plain_text, a)
        sub_result = subbytes(xor_result)
        shift_rows = ShiftRows(sub_result)
        mix_colmns = mixcolums(shift_rows)

        if 1 <= mix_colmns !=14:
            mix_colmns = mixcolums(shift_rows)
        
        if 1 <= i < 15:
            
            if i % 2 == 0:
                key_round += 1
                key  = key_expansion(key,key_round)
                key1 = (key >> 128)
                a=key1
                            
            else:
                key2 = (key % (2**128))
                a=key2
            
                   


        plain_text = mix_colmns

        print(i)

        print("round[",i,"]start",  (hex(xor_result)))
        print("round[",i,"]s_box",  (hex(sub_result)))
        print("round[",i,"]s_row",  (hex(shift_rows)))
        if i !=14:
            print("round[",i,"]m_col",  (hex(mix_colmns)))
        print("round[",i,"]k_sch",  (hex(a)))
    
    output = xor(shift_rows,a)
    print("round[",i,"]output", (hex(output)))
    return output


#TEST --------------------------------------------------------------------------------------
from Crypto.Cipher import AES
from random import randrange
test_count = 1000
success = 0
fail = 0
for i in range(0,test_count):
 
    plain_text = randrange(0,2**128)
    key = randrange(0,2**256)
    cipher = AES.new(key.to_bytes(32, byteorder='big'), AES.MODE_ECB)
    ct_expected = cipher.encrypt(plain_text.to_bytes(16, byteorder='big'))
    ct_expected = int.from_bytes(ct_expected, byteorder='big')
    ct_computed = aes(plain_text,key)
 
    if(ct_computed != ct_expected):
        print("ERROR !")
        print("plain_text = ", hex(plain_text))
        print("ct_expected = ", hex(ct_expected))
        print("ct_computed = ", hex(ct_computed))
        print("key = ", hex(key))
        fail += 1
    else:
        success +=1
 
print("Total Succes =", success)
if fail > 0:
    print("Fail Count =", fail)
