function D = ConvertDescBinary2Decimal(B)

% B is a 256-dimensional row vector
if size(B,1) == 1
  B = B';
end

assert(size(B,1) == 256)

Bb = reshape(B, 8, 32)';
d = 2.^(7:-1:0);

D = zeros(1,32);
for j=1:32
  D(j) = Bb(j,:) * d';  
end
end