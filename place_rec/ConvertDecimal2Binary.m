function B = ConvertDecimal2Binary(D)
B = [];
for d=1:length(D) 
  B = [B, str2num(dec2bin(D(d),8)')'];
end

D2=ConvertDescBinary2Decimal(B);
assert(norm(D2 - D) == 0);
end