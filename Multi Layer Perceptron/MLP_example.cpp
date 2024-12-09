//EXAMPLE OF A TINY NETWORK TO PROVE THE FUNCTIONALITY OF THE MLP IMPLEMENTATION
using namespace std;
#include <iostream>
#include <vector>


int main()
{
    vector<float> biasL0 = {0.021, 0.0031, 0.3011, 0.000301};
    vector<float> biasL1 = {0.00013004,0.00323};
    
    vector<vector<float>> weightsL0 = {{0.31352, 0.324292, -0.613, -0.00032, 0.032321, -0.030002},
                                        {0.0003, 0.14030, -0.43912, -0.3230242, 0.13190, 0.93},
                                        {0.04351, -0.429092, 0.023033, 0.429085, 0.324280, 0.00221},
                                        {-0.9843989,0.000002034,0.00042898,-0.00010,0.3418,0.2849}};
                                        
    vector<vector<float>> weightsL1 = {{0.314920,0.13109841,0.0010491,0.0109402},
                                        {-0.034902,0.032402,-0.0000023,0.20982}};
                                        
    vector<float> inputs = {0.903, 0.003013, 0.0314, 0.23, 0.14214,0.141};
    
    vector<float> resultL0;
    for(int i = 0; i < 4; i ++){
        //First layer, 4 neurons
        //Perform the dotproduct
        float dp = 0;
        for(int j = 0; j < 6; j++){
            dp += inputs[j] * weightsL0[i][j];
        }
        resultL0.push_back(dp+biasL0[i]);
    }
    
    vector<float> resultL1;
    for(int i = 0; i < 2; i++){
        float dp = 0;
        for(int j = 0; j < 4; j++){
            dp+= resultL0[j]*weightsL1[i][j];
        }
        resultL1.push_back(dp+biasL1[i]);
    }
    cout << "L0 results: " << resultL0[0] << " | " << resultL0[1] << " | " << resultL0[2] << " | " << resultL0[3] << endl;
    cout << "Result of this MLP = " << resultL1[0] << " | "<< resultL1[1] << endl;

    return 0;
}