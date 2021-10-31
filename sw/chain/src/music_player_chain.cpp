/* 
Main function to call music_bib
Author: Tobias Thies
Date: 03.07.2021
Maintanance: Tobias Thies
Descriptition: WIP
*/

#include <iostream>
#include <string>
#include <vector>
#include "libmusic_lib.h"
//#include "modules/xml_filesystem/xml_control.cpp"

using namespace std;

int main()
{
    // Music Bib Stuff

    //XML_Control xml_filesystem;
    Music_List music_list;
    Base_Music_Title music_title;

    //xml_filesystem.Create_XML_File();

    int number_of_titles = -1;

    number_of_titles = music_list.Get_Number_Titles();
    cout << " number_of_titles: " << number_of_titles << "\n";

    music_list.Add_Title();
    number_of_titles = music_list.Get_Number_Titles();
    cout << " number_of_titles: " << number_of_titles << "\n";

    string str = "Hallo!";
    string name_out = "not";
    string interpret_out = "author";
    vector<string> labels_out;
    string label1 = "ROCK";
    string label2 = "FUNK";

    music_title.Set_Title(str, interpret_out);
    music_title.Add_Label(label1);
    music_title.Add_Label(label2);
    music_title.Get_Title(name_out, interpret_out, labels_out);

    for (int it = 0; it < labels_out.size(); ++it)
    {
        cout << " label " << it+1;
        cout << " :" << labels_out[it];
    }
    int x;
    cin >> x;

    return 0;

}