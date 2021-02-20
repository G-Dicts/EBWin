# 2015/09/09	Ver2

Dir.glob("*.uni") {|file|

File.open(file, "rb") do |f|

  basename = file.gsub(/(.*).uni/i,'\1') 
  outf = File.open( basename + ".map" ,'w')

  outf.printf "# %s.uni -> %s.map\n",basename,basename
  outf.puts

  univer = 1

  # half size gaiji

  if ( head = f.read(4) )
    if head == "Ver2"
      f.read(2)	# 0x20 0x20
      head = f.read(4)
      univer = 2
    end
    a = head.unpack("C*")
    num = a[2]*256+a[3]

    num.times{
      if univer == 2
        rec = f.read(16)
      else
        rec = f.read(12)
      end
      data =  rec.unpack("C*")
      if data[6]>0 || data[7]>0
        outf.printf "h%02x%02x\tu%02x%02x\t\n",data[0],data[1],data[6],data[7]
      end

#    printf "%02x%02x %02x%02x %02x%02x %02x%02x %02x%02x %02x%02x \n",data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],data[8],data[9],data[10],data[11]

    }
  end

  outf.puts

  # full size gaiji
  if ( head = f.read(4) )
    a = head.unpack("C*")
    num = a[2]*256+a[3]

    num.times{
      if univer == 2
        rec = f.read(16)
      else
        rec = f.read(12)
      end
      data =  rec.unpack("C*")
      if data[6]>0 || data[7]>0
        outf.printf "z%02x%02x\tu%02x%02x\t\n",data[0],data[1],data[6],data[7]
      end
#    printf "%02x%02x %02x%02x %02x%02x %02x%02x %02x%02x %02x%02x \n",data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],data[8],data[9],data[10],data[11]

    }
  end

end

}
