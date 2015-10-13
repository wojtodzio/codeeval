import sys

def ifmatching(m,n):
    if not n or not m:
        return False
    if 'B' not in n:
        return True
    if 'A' in n:
        return False
    if m=='1':
        return True
    return False

def markdown(i,j):
    global s1,s2,x,y,mtx
    if mtx[x-1][y-1]:
        return
    # if it's last 2nd line now, caculate mtx[x-1][y-1] directly.
    # to save time
    if i==x-2:
        if ifmatching(s1[i+1],s2[j+1:]):
            mtx[x-1][y-1]=1
        return 
    row=i+1
    for col in range(j+1,y-x+i+2):
        if not mtx[row][col]:
            if not ifmatching(s1[row],s2[j+1:col+1]):
                break
            mtx[row][col]=1
            markdown(row,col)


test_cases = open(sys.argv[1], 'r')
for test in test_cases:
    s1,s2=test.strip().split(' ')
    x,y=len(s1),len(s2) #x is length of 1st argument, y is 2nd.

    if x>y or x<1 or y<1:
        print "No"
        continue

    # mtx initilized as 0 all.
    mtx=[[0 for col in range(y)] for row in range(x)]

    # len of s1=1, just a simple check.
    if x==1:
        print "Yes" if ifmatching(s1,s2) else "No"
        continue

    # when x>1
    # init mtx[0], 1st row, check s1[0] if matching s2[0-?]
    for j in range(y-x+1):
        if not ifmatching(s1[0],s2[:j+1]):
            break
        mtx[0][j]=1
        markdown(0,j)
    

    print "Yes" if mtx[x-1][y-1] else "No"

test_cases.close()
