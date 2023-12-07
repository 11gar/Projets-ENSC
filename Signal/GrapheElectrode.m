function [] = GrapheElectrode(i,data)
   [fftBlocsOuverts,fftBlocsFermes]=getBlocs(i,data);
   figure;
   plot(mean(fftBlocsOuverts));
   hold on
   plot(mean(fftBlocsFermes));
   hold off
   axis([80 120 0 100]);
   legend('FFT Yeux Ouverts','FFT Yeux Fermés')
end
