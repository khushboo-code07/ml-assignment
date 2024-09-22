clc
clear all;
disp('**** ANALYSIS OF TRANSMISSION LINE ****')
disp(' ')
disp('1: Find length of transmission line ')
disp('2: Finding Efficiency and Regulation of a transmission line')
disp(' ')
Op = input('Enter your option');
disp(' ')
switch Op
    case 1
        Pr = input('Enter Power Receiving end: ');
        Ef = input('Enter Efficiency of transmission line: ');
        Vr = input('Enter Receiving end voltage: ');
        alpha = input('Enter copper conductance: ');

        Ps = Pr / Ef;
        li = Ps - Pr;
        Pr = Pr / (Vr * 1.2);
        R = 1 / (2 * (alpha)^2);
        L = (R * alpha) / (1.725 * 10^6);

        disp('Power sending end: ')
        disp(Ps)
        disp('Line losses: ')
        disp(li)
        disp('The length of transmission line:')
        disp(L)
        if L <= 60
            fprintf('This is a Short transmission line')
            disp(' ')
        elseif L > 60 && L <= 160
            fprintf('This is Medium transmission line')
            disp(' ')
        else
            fprintf('This is Long transmission line')
            disp(' ')
        end
    case 2
        L = input('Length of transmission line in km\n');
        Vr = input('Receiving end voltage in kV\n');
        r = input('Per km resistance in ohm\n');
        li = input('Per km inductance in mH\n');
        S = input('Receiving power in MVA\n');
        Fi = input('Lagging power factor\n');

        S = S * (10^6);
        Vr = Vr * (10^3);
        li = (10^-3);
        ind = (li * L);
        R = r * L;
        Vr = Vr / sqrt(3);
        Z = complex(R, 2 * pi * 50 * ind);
        J = sqrt(-1);

        if L <= 60
            disp('------ THIS IS SHORT TRANSMISSION LINE ------')
            disp(' ')
            A = 1;
            B = Z;
            C = 0;
            D = A;
        elseif L > 60 && L <= 160
            disp('------ THIS IS MEDIUM SHORT TRANSMISSION LINE ------')
            disp(' ')
            c = input('Per km capacitance in uF\n');
            c = c * (10^-6);
            Y = 2 * pi * 50 * c * L * J;
            A = (Y / 2) * Z + 1;
            B = Z * ((Y / 4) * Z + 1);
            C = Y;
            D = A;
        else
            disp('------ THIS IS LONG TRANSMISSION LINE ------')
            disp(' ')
            c = input('Per km capacitance in uF\n');
            c = c * (10^-6);
            Y = 2 * pi * 50 * c * L * J;
            K = sqrt(Y * Z);
            M = sqrt(Y / Z);
            A = cosh(K);
            B = sinh(K) / M;
            C = M * sinh(K);
            D = A;
        end

        Ir = S / ((sqrt(3) * Vr));
        IR = ((Ir) * complex(cos(-acos(Fi)), sin(-acos(Fi))));
        Vs = A * Vr + B * IR;
        IS = C * Vr + D * IR;
        Ps = 3 * real(Vs * (conj(IS)));
        VR = abs(((((abs(Vs) / abs(A)) - abs(Vr)) / abs(Vr)) * 100));
        Pr = S * 0.8;
        EF = (Pr / Ps) * 100;
        Qs = 3 * imag(Vs * (conj(IS)));
        F = cos(atan(Qs / Ps));

        fprintf('\n')
        disp('No load receiving end voltage');
        disp(abs(Vr))
        disp('No load sending end current');
        disp(abs(IS))
        disp('Sending end p.f.');
        disp(F)
        disp('Voltage Regulation of the line');
        disp(VR)
        disp('Transmission Efficiency of the line');
        disp(EF)
end