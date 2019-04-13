with open("in.txt", "r") as f:
    out = open("out.txt", "w")
    data = f.read().splitlines()
    l = []
    for s in data:
        b = s.replace("0x", "").replace(",", "").split("//")[0]
        l.append(bytes.fromhex(b))
    ch_b = bytearray()
    ch_b.append(0x20)
    for i in l:
        b = bytearray()
        b.append(0x00)
        for j in range(7):
            x = 0x00
            for k in range(5):
                if (i[k] & (0x01 << j)) != 0:
                    x |= 0x01
                x <<= 1
            b.append(x << 2)
        b.append(0x00)
        str = ""
        for y in range(9):
            str += "0x{0:0>2x}, ".format(b[y])
        #print(str + "\t//0x{0:0>2x} '{1}'".format(ch_b[0], ch_b.decode("ascii")))
        out.write("\t" + str + "\t//0x{0:0>2x} '{1}'\n".format(ch_b[0], ch_b.decode()))
        ch_b[0] += 1
    out.close()
