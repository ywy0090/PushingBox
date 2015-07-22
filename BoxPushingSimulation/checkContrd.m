function flag = checkContrd(currentA, nextA)
flag1 = (currentA ==1 && nextA == 2);
flag2 = (currentA ==2 && nextA == 1);
flag3 = (currentA ==3 && nextA == 4);
flag4 = (currentA ==4 && nextA == 3);
if(flag1 || flag2 || flag3 || flag4)
    flag = 1;
else
    flag = 0;
end
end