
Experimentally find out what are the remainders (do you recognize a repetion?) of square numbers if we divide by $5$.
sol = [0,1,4,4,1]
for i in range(1000000):
    val = i^2 % 5
    if val != sol[i % 5]:
        print("Counter example:",i,val)
print("Finished")


Find the relatively prime/co-primes to an $n$ number (call as $L$ set) and draw a directed graph that shows the "a divides b" relation on the $L\setminus\{1\}$ set.
n = 15

L = [x for x in range(n) if gcd(x,n)==1]
LM1Set = Set(L) - Set([1])
DiGraph([LM1Set,lambda x,y: x  % y == 0]).show(figsize=6)



How many divisors the $15^3*12^6*23^2*14$ number has thet relatively prime to $21$ (use factorization)?

factor(15^3*12^6*23^2*14)
factor(21)
(13+1)*(3+1)*(2+1)

%md
Find the smallest $n$ where the number of divisors is 23.

n = 1
while len(divisors(n)) != 23:
    n = n + 1#
n
divisors(35)

%md
Experimentally test if we can always find a bigger a prime number with a form of $6k+1$ (Create a function that gives us the first $n$ prime number with this form).
︡483849e1-140a-4b2d-b6b0-f51f315896be︡{"done":true,"md":"Experimentally test if we can always find a bigger a prime number with a form of $6k+1$ (Create a function that gives us the first $n$ prime number with this form)."}

def first6kp1_primes(n):
    k = 1
    ret = []
    while len(ret) < n:
        val = 6*k + 1
        if is_prime(val):
            ret.append(val)
        k += 1
    return ret

first6kp1_primes(100)



Create a table that shows the variable values in the Euclidean Algorithm (or Extended Euclidean Algorithm) in every step.
rows = [["a","b","r"]]
a = 123
b = 2312
while b != 0:
    r = a % b
    rows.append([a,b,r])
    a,b = b,r
rows.append([a,b,r])
table(rows)

%md
We have only coins valued 32 and 64 (or 48 and 28). How many combinations do I have to pay 1024?
# 32x+64y=1024
xgcd(32,64)
# 32*1+64*0=32
1024 / 32
# 32*32+64*0=1024
x0 = 32
y0 = 0
c = 0
for t in range(50):
    x = x0 + 64 / 32 * -t
    y = y0 - 32 / 32 * -t
    print(x,y,32*x+64*y)
    if x > 0 and y > 0:
        c += 1

print(c,"combinations")

Draw the relation graph of "a divides b" in mod $p$, where $p$ is prime.
p = 7
DiGraph([Set([1..p]),lambda x,y: x % y == 0]).show()
%md

Solve the $172x + 62y = 38$ equation with Extended Euclidean Algorithm.
xgcd(172,62)
#172*-9+62*25=2
38/2
#172*−171+62*475=38
172*-171+62*475
-9*19
25*19
62*25

Validate experimentally that $\varphi(n)$ is even if $n\geq3$ and $\varphi(ab)=\varphi(a)\varphi(b)$, if $gcd(a,b)=1$.

euler_phi(6)
for i in range(1000):
    a = randint(2,100)
    b = randint(2,100)
    n = a * b
    if n >= 3:
        if euler_phi(n) % 2 == 0:
            pass #ok
        else:
            print("test first failed on",a,b)

    if gcd(a,b) == 1:
        if euler_phi(a*b) == euler_phi(a) * euler_phi(b):
            pass #ok
        else:
            print("test second failed on",a,b)
print("finished")


Calculate $1231^{21}\pmod{31}$ with less than $7$ multiplication using only % and * operators.
#21 = 16 + 4 + 1
x = 1231
x2 = x*x % 31
x4 = x2*x2 % 31
x8 = x4*x4 % 31
x16 = x8*x8 % 31

x * x4 * x16 % 31
x^21 % 31


Calculate $109^{35123123123125}\pmod{14}$ with Euler-Fermat Theorem.

gcd(109,14)
euler_phi(14)
355 // 6
355 % 6
show("$109^{355} = 109^{59*6+1}\pmod{14} = {109^{6}}^{59}*109\pmod{14}=109$")
109 % 14

What is a remainder of $293^{275}/48$ integer divison (Use Euler-Fermat Theorem)?

gcd(293,48)
"--------"
euler_phi(48)
"--------"
275 // 16
"--------"
275 % 16
"--------"
293 % 48

"--------"
#(5 ^ 16)^17*5^3
5^3 % 48

%md

Solve with XGCD the following equation for integers.

a) $21x ≡ 14\pmod{35}$

b) $12x ≡ 9\pmod{18}$

c) $10x ≡ 25 \pmod{35}$

#21x = 14 mod 35
#21x = 14 + k *35
#21x - 35k = 14
xgcd(21,35)
# 21 * 2 - 35 * -1 = 7
# 21 * (2 * 2) - 35 * (-1 * 2) = 14
21 * 4 % 35

#12x+18k=9
xgcd(12,18)
#There isn'T solution, 6 doesn't divide 9 

#10x+35k = 25
xgcd(10,35)
#10*-3 + 35 * 1 = 5
#10*-15 + 35 * 5 = 25
x = -15
10* -15 % 35


Calculate $80^{31412314123122}\pmod{7}$ with Euler-Fermat theorem.
80 % 7
euler_phi(7)
31412314123122 // 6
31412314123122 % 6

#80^31412314123122 = (80^6)^5235385687187 = 1


%md
Find x without using CRT.

$\begin{aligned}
    5x&\equiv3\pmod{7}\\
    3x&\equiv7\pmod{8}\\
\end{aligned}$

inverse_mod(5,7) * 3 % 7
# x = 2 mod 7

inverse_mod(3,8) * 7 % 8
# x = 5 mod 8

# x = 2 + 7k
# x = 5 + 8s
# 2 + 7k = 5 + 8s
# 7k - 8s = 3
xgcd(7,-8)
# 7 * -1 - 8 * -1 = 1
# 7 * -3 - 8 * -3 = 3
x = 2 + 7 *(-3)
print(mod(x,7*8))
%md

Find x with CRT.

$\begin{aligned}
    2x&\equiv1\pmod{3}\\
    3x&\equiv4\pmod{4}\\
    4x&\equiv4\pmod{5}\\
\end{aligned}$
vm3 = inverse_mod(2,3) * 1 % 3
vm4 = inverse_mod(3,4) * 4 % 4
vm5 = inverse_mod(4,5) * 4 % 5

x = crt([vm3,vm4,vm5],[3,4,5])

2 * x % 3
3 * x % 4
4 * x % 5








