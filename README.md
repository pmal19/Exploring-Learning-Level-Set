# Exploring-Learning-Level-Set

This is a project exploring the possibilities of using Level Sets as a tool for partitioning a feature space into different regions belonging to different classes.

Level Sets are best known for their implicit representations and a their capabilities to alter easily topologies to suit the space.
This makes it an ideal candidate for segmenting or partitioning any feature space and thus can be used to identify regions where certain classes might lie - i.e using it as a classifier.
Similar approaches have explored by Varshney, Kush R., and Alan S. Willsky. "Classification using geometric level sets." Journal of Machine Learning Research 11.Feb (2010): 491-516 and Cai, Xiongcai, and Arcot Sowmya. "Level learning set: A novel classifier based on active contour models." European Conference on Machine Learning. Springer Berlin Heidelberg, 2007.
Here I have used the Active Contour model presented by Chan-Vese [Chan, Tony F., and Luminita A. Vese. "Active contours without edges." IEEE Transactions on image processing 10.2 (2001): 266-277.] (code - Copyright (c) 2009, Yue Wu
All rights reserved - http://in.mathworks.com/matlabcentral/fileexchange/23445-chan-vese-active-contours-without-edges) and suggested a slight modification to their evolution equation.

The energy minimisation proposed by Chan-Vese is - 
<img src="http://www.sciweavers.org/tex2img.php?eq=F%28%5Cphi%2Cc_%7B1%7D%2Cc_%7B2%7D%29%20%3D%20%26%5Clambda_%7B1%7D%20%5Cint_%7B%5COmega%7D%20%7CI-c_%7B1%7D%7C%5E%7B2%7D%20H%28%5Cphi%29%2B%20%5Clambda_%7B2%7D%20%5Cint_%7B%5COmega%7D%20%7CI-c_%7B2%7D%7C%5E%7B2%7D%20%281-H%28%5Cphi%29%29%2B%20%5Cnu%5Cint_%7B%5COmega%7D%20H%28%5Cphi%29%2B%20%5Cmu%28%5Cint_%7B%5COmega%7D%5Cleft%20%7C%20%5Cnabla%20H%28%5Cphi%29%20%5Cright%20%7C%20%29%5E%7Bp%7D&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt="F(\phi,c_{1},c_{2}) = &\lambda_{1} \int_{\Omega} |I-c_{1}|^{2} H(\phi)+ \lambda_{2} \int_{\Omega} |I-c_{2}|^{2} (1-H(\phi))+ \nu\int_{\Omega} H(\phi)+ \mu(\int_{\Omega}\left | \nabla H(\phi) \right | )^{p}" width="714" height="25" />

I modify the equation by adding another term - 
<img src="http://www.sciweavers.org/tex2img.php?eq=F%28%5Cphi%2Cc_%7B1%7D%2Cc_%7B2%7D%29%20%3D%20%5Clambda_%7B1%7D%20%5Cint_%7B%5COmega%7D%20%7CI-c_%7B1%7D%7C%5E%7B2%7D%20H%28%5Cphi%29%2B%20%5Clambda_%7B2%7D%20%5Cint_%7B%5COmega%7D%20%7CI-c_%7B2%7D%7C%5E%7B2%7D%20%281-H%28%5Cphi%29%29%2B%20%5Cnu%5Cint_%7B%5COmega%7D%20H%28%5Cphi%29%2B%20%5Cmu%28%5Cint_%7B%5COmega%7D%5Cleft%20%7C%20%5Cnabla%20H%28%5Cphi%29%20%5Cright%20%7C%20%29%5E%7Bp%7D%20%2B%20%5Clambda_%7B3%7D%20%5Cint_%7B%5COmega%7D%20%7Cc_%7B1%7D-X_%7Bt%7D%7C%5E%7B2%7D%20H%28%5Cphi%29&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt="F(\phi,c_{1},c_{2}) = \lambda_{1} \int_{\Omega} |I-c_{1}|^{2} H(\phi)+ \lambda_{2} \int_{\Omega} |I-c_{2}|^{2} (1-H(\phi))+ \nu\int_{\Omega} H(\phi)+ \mu(\int_{\Omega}\left | \nabla H(\phi) \right | )^{p} + \lambda_{3} \int_{\Omega} |c_{1}-X_{t}|^{2} H(\phi)" width="886" height="46" />

Here the term - 
<img src="http://www.sciweavers.org/tex2img.php?eq=%5Clambda_%7B3%7D%20%5Cint_%7B%5COmega%7D%20%7Cc_%7B1%7D-X_%7Bt%7D%7C%5E%7B2%7D%20H%28%5Cphi%29&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt="\lambda_{3} \int_{\Omega} |c_{1}-X_{t}|^{2} H(\phi)" width="162" height="46" />
 ensures that <img src="http://www.sciweavers.org/tex2img.php?eq=c_%7B1%7D&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt="c_{1}" width="21" height="15" /> converges to <img src="http://www.sciweavers.org/tex2img.php?eq=X_%7Bt%7D&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt="X_{t}" width="21" height="18" />
which is the target class. Thus we can target the classification of each class separately. 
