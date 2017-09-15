l = [i1 i2 i3]; %constant rates of the input link
u = [o1 o2 o3]; %constant rates of the output link
n = [s1 s2 s3]; %constant values of the buffer size
y=rand (1,1000); % creating a random number generator
for i=1:3
for j=1:3
for k=1:3
q = 0; % initializing initial packets in queue as zero
d =0; % initializing initial packets dropped as zero
for x=1:1000 % repeating the loop for 1,000 times
if y(x)<= l(i)/(l(i)+u(j));
if q < n(k) % if packet in queue is less than the buffer size
q = q+1; % packet is added to the queue
else
d = d+1; % if packet in queue is more than the buffer size then the packet is dropped
end
else
if q > 0 % checking whether the queue is empty or not
q = q-1; % if the queue is empty, then the packet is delivered
end
end
P(1,x) = q; % packet in queue is stored after each iteration
P(2,x) = d; % packet dropped is stored after each iteration
end
S= 1:1:1000; % Simulated events ID running in steps of 1
q1 =P(1,:); % value of packets in queue
d1=P(2,:); % value of packets dropped
figure;
plot(S,q1); % plotting packets in queue
hold on;
plot (S, d1,'r--'); % plotting packets dropped 
xlabel('ID of Simulated Events');
ylabel('Number of packets');
end
end
end
