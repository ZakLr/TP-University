    program tp2;

    type
    unip = ^uni;
    facp = ^fac;
    depp = ^dep;
    spcp = ^spc;
    etup = ^etu;

    uni = record
        name: string;
        nxt: unip;
        nextchp: facp;
    end;

    fac = record
        name: string;
        nxt: facp;
        nextchp: depp;
    end;

    dep = record
        name: string;
        nxt: depp;
        nextchp: spcp;
    end;

    spc = record
        name: string;
        nxt: spcp;
        nextchp: etup;
    end;

    etu = record
        name: string;
        year: integer;
        nxt: etup;
    end;

    var
    ptp1, tmp1, ba1: unip;
    ptp2, tmp2, ba2,ba22,tmp111,factemp,firstfac,p,y,tt: facp;
    ptp3, tmp3, ba3,depptemp,tmp2222: depp;
    ptp4,tmp4,ba4,tru,tmp222: spcp;
    ptp5,tmp5,ba5: etup;
        u,yr,count_sp,count_dp,count_fc,count_spv,count_dpv,count_fcv: integer;
    s,s2,s3,s4,s5,stmp: string;
    b1,b2:boolean;

    // Procedure to create a new node(faculty)
    procedure CreateNewNode(var Node: facp; Name: string);
    begin
    // Allocate memory for the new node
    New(Node);
    Node^.Name := Name;
    node^.nextchp:=nil;
    Node^.Nxt := nil;
    end;

      // Procedure to create a new node( departement)
    procedure CreateNewNodedep(var Node: depp; Name: string);
    begin
    // Allocate memory for the new node
    New(Node);
    Node^.Name := Name;
    node^.nextchp:=nil;
    Node^.Nxt := nil;
    end;

    // Procedure to add a new node to the linked list
    procedure AddNodeToList(var ba2, Tail: facp; Name: string);
    begin
    // Create a new node
    CreateNewNode(ptp2, Name);
    // If the linked list is empty, set the head and tail pointers to the new node
    if ba2 = nil then
    begin
        ba2 := ptp2;
        Tail := ptp2;
    end
    // Otherwise, add the new node to the end of the linked list
    else
    begin
        Tail^.Nxt := ptp2;
        Tail := ptp2;
    end;
    end;


    // Procedure to add a new node to the linked list (dapa)
procedure AddNodeToListdep(var b, Tail: depp; Name: string);
begin
  // Create a new node
  CreateNewNodedep(ptp3, Name);
  // If the linked list is empty, set the head and tail pointers to the new node
  if b = nil then
  begin
    b := ptp3;
    Tail := ptp3;
  end
  // Otherwise, add the new node to the end of the linked list
  else
  begin
    Tail^.Nxt := ptp3;
    Tail := ptp3;
  end;
end;


    // Procedure to display the names of all nodes in the linked list
    procedure DisplayLinkedListNames(b: facp);
    var
    tmp: facp;
    i: integer;
    begin
    tmp := b;
    i := 1;
    while tmp <> nil do
    begin
        writeln(i, ' ', tmp^.name);
        inc(i);
        tmp := tmp^.nxt;
    end;
    end;
    ///////////////////////////////////////////////////////////////////////////////////////
function SearchAFaculty(b:facp;ss:string):facp;
var

tmp1:facp;
i,j:integer;
begin
SearchAFaculty:=nil;
tmp1:=b;
i:=0;
while tmp1<> nil do begin
  tmp1:=tmp1^.nxt;
  i:=i+1;
end;
j:=0;
tmp1:=b;
  while (tmp1 <> nil) and (j<=i) do 
  begin
  if tmp1^.name = ss then SearchAFaculty:=tmp1 else
   tmp1:=tmp1^.nxt;
   j:=j+1;end;

end;
///////////////////////////////////////////////////////////////////////////////////////////////

function SearchAFacultynxt(b:facp;ss:string):facp;
var

tmp1:facp;
begin
SearchAFacultynxt:=nil;
tmp1:=b;
  while (tmp1 <> nil) and (tmp1^.nxt^.name <> ss) do tmp1:=tmp1^.nxt;
  if tmp1^.nxt^.name = ss then SearchAFacultynxt:=tmp1;

end;



///////////////////////////////////////////////////////////////////////////////////////////
procedure DisplayLinkedListNamesDep(b: depp);
    var
    tmp1: depp;
    i: integer;
    begin
    tmp1 := b;
    i := 1;
    while tmp1 <> nil do
    begin
        writeln(i, ' ', tmp1^.name);
        inc(i);
        tmp1 := tmp1^.nxt;
    end;
    end;
///////////////////////////////////////////////////////////////////////////////////////////////////
function SearchADepartement(b:depp;ss:string):depp;//in b we do SearchAFaculty^.nxtchpp
var
tmp1:depp;
begin
tmp1:=b;
  while (tmp1 <> nil) and (tmp1^.name <> ss) do tmp1:=tmp1^.nxt;
  if tmp1^.name = ss then SearchADepartement:=tmp1;

end;
////////////////////////////////////////////////////////////////////////////////////////////////
function SearchADepartementnxt(b:depp;ss:string):depp;//in b we do SearchAFaculty^.nxtchpp
var
tmp1:depp;
begin
tmp1:=b;
  while (tmp1 <> nil) and (tmp1^.nxt^.name <> ss) do tmp1:=tmp1^.nxt;
  if tmp1^.nxt^.name = ss then SearchADepartementnxt:=tmp1;

end;






////////////////////////////////////////////////////////////////////////////////////////////
procedure CreateNewNodespc(var Node:spcp ; Name: string);
begin
  // Allocate memory for the new node
  New(Node);
  Node^.Name := Name;
  Node^.Nxt := nil;
end;

  // Procedure to add a new node to the linked list
procedure AddNodeToListspc(var b, Tail: spcp; Name: string);
begin
  // Create a new node
  CreateNewNodespc(ptp4, Name);
  // If the linked list is empty, set the head and tail pointers to the new node
  if b = nil then
  begin
    b := ptp4 ;
    Tail := ptp4;
  end
  // Otherwise, add the new node to the end of the linked list
  else
  begin
    Tail^.Nxt := ptp4;
    Tail := ptp4;
  end;
end;

/////////////////////////////////////////////////////////////////////////////////////////
function SearchASpeciality(b:spcp;ss:string):spcp;// same here as before
var
tmp1:spcp;
begin

tmp1:=b;
  while (tmp1 <> nil) and (tmp1^.name <> ss) do tmp1:=tmp1^.nxt;
  if tmp1^.name = ss then SearchAspeciality:=tmp1;

end;

/////////////////////////////////////////////////////////////////////////////


function SearchASpecialitynxt(b:spcp;ss:string):spcp;// same here as before
var
tmp1:spcp;
begin

tmp1:=b;
  while (tmp1 <> nil) and (tmp1^.nxt^.name <> ss) do tmp1:=tmp1^.nxt;
  if tmp1^.nxt^.name = ss then SearchAspecialitynxt:=tmp1 else SearchASpecialitynxt:=nil

end;
//////////////////////////////////////////////////////////////////////////////////////////

procedure DisplayLinkedListNamesSpc(b: spcp);
    var
    tmp1: spcp;
    i: integer;
    begin
    tmp1 := b;
    i := 1;
    while tmp1 <> nil do
    begin
        writeln(i, ' ', tmp1^.name);
        inc(i);
        tmp1 := tmp1^.nxt;
    end;
    end;
//////////////////////////////////////////////////////////////////////////////////////////////////////

procedure DisplayLinkedListNamesetu(b: etup);
    var
    tmp1: etup;
    i: integer;
    begin
    tmp1 := b;
    i := 1;
    while tmp1 <> nil do
    begin
        writeln(i, ' ', tmp1^.name);
        inc(i);
        tmp1 := tmp1^.nxt;
    end;
    end;

procedure CreateNewNodesetu(var Node:etup ; Name: string; l:integer);
begin
  // Allocate memory for the new node
  New(Node);
  Node^.Name := Name;
  Node^.year:=l;
  Node^.Nxt := nil;
end;




  // Procedure to add a new node to the linked list
procedure AddNodeToListetu(var b, Tail: etup; Name: string; l: integer);
begin
  // Create a new node
  CreateNewNodesetu(ptp5, Name, l);
  // If the linked list is empty, set the head and tail pointers to the new node
  if b = nil then
  begin
    b := ptp5 ;
    Tail := ptp5;
  end
  // Otherwise, add the new node to the end of the linked list
  else
  begin
    Tail^.Nxt := ptp5;
    Tail := ptp5;
  end;
end;

function SearchAEtu(b:facp;ss:string):etup;// same here as before
var
tmp11:facp;
tmp22:depp;
tmp33:spcp;
tmp44:etup;

r:etup;
t:boolean;
begin
tmp11:=b;
t:=true;
  while (tmp11 <> nil) and t do 
  begin
    tmp22:=tmp11^.nextchp;
    while (tmp22 <> nil) and t Do 
        begin
          tmp33:=tmp22^.nextchp;
          while (tmp33 <> nil) and t do
            begin
                tmp44:=tmp33^.nextchp;
                while (tmp44 <> nil) and (t) do
                    begin
                        if tmp44^.name = ss then begin
                            t:=false;
                            r:=tmp44;end;
                        tmp44:=tmp44^.nxt;
                    end;
                tmp33:=tmp33^.nxt;
            end;
            tmp22:=tmp22^.nxt;
        end;
    tmp11:=tmp11^.nxt;
  end;
  if (not t) then SearchAEtu:= r else SearchAEtu:= nil;

end;

function SearchAEtunxt(b:facp;ss:string):etup;// same here as before
var
tmp11:facp;
tmp22:depp;
tmp33:spcp;
tmp44:etup;

r:etup;
t:boolean;
begin
tmp11:=b;
t:=true;
  while (tmp11 <> nil) and t do 
  begin
    tmp22:=tmp11^.nextchp;
    while (tmp22 <> nil) and t Do 
        begin
          tmp33:=tmp22^.nextchp;
          while (tmp33 <> nil) and t do
            begin
                tmp44:=tmp33^.nextchp;
                while (tmp44 <> nil) and (t) do
                    begin
                        if tmp44^.nxt^.name = ss then begin
                            t:=false;
                            r:=tmp44;end;
                        tmp44:=tmp44^.nxt;
                    end;
                tmp33:=tmp33^.nxt;
            end;
            tmp22:=tmp22^.nxt;
        end;
    tmp11:=tmp11^.nxt;
  end;
  if (not t) then SearchAEtunxt:= r else SearchAEtunxt:= nil;

end;


////////////////////////////////////////////////////////////////////////////////////////////////////
procedure deletefac( var p:facp; var ba22:facp; b2: boolean);

var tmp22:depp;
  e,wanted:facp;
  tmp33:spcp;
  tmp44:etup;
  t:boolean;
  d,u:integer;
  tt:depp;
begin
  t:=true;
  d:=0;
  u:=0;
  tt:=p^.nextchp;
  while tt <> nil do begin
    tt:=tt^.nxt;
    d:=d+1;
  end;
    tmp22:=p^.nextchp;
    while (tmp22 <> nil) and t Do 
        begin
          tmp33:=tmp22^.nextchp;
          while (tmp33 <> nil) and t do
            begin
                tmp44:=tmp33^.nextchp;
                        if tmp44 = nil then 
                        begin
                         u:=u+1;
                         t:=u<=d;
                         end else exit;
                tmp33:=tmp33^.nxt;
            end;
            tmp22:=tmp22^.nxt;
        end;

  if not t then begin 
    if p=ba22 then
    ptp1^.nextchp:=ba22 else begin
    
   e:=ba22;
    while e^.nxt <> p do e:=e^.nxt;
    e:=e^.nxt^.nxt;
    dispose(p);
    p:=e;
   // b2:= not t;
  end;



  end;

end;


procedure deletefac2(var p,y: facp);
begin
  
if p^.nextchp = nil then y^.nxt:= y^.nxt^.nxt else if p^.nextchp^.nextchp=nil then y^.nxt:= y^.nxt^.nxt else if p^.nextchp^.nextchp^.nextchp=nil then 
    y^.nxt:= y^.nxt^.nxt;
 
end;





////////////////////////////////////////////////////////////////////////////////////////////////////

procedure suppS( p:spcp;b :boolean;pere:depp);
var 
tmp:spcp;


begin
  if (p^.nextchp=nil) then
  begin
    if b then pere^.nextchp:=p^.nxt;
    dispose(p);
  end else begin
  tmp:=pere^.nextchp;
  while tmp^.nxt <> p do tmp:=tmp^.nxt;
  tmp^.nxt:=tmp^.nxt^.nxt;
  dispose(p);
          end;


end;



procedure suppD(p:depp; b:boolean; pere:facp);

var 
tmp:depp;


begin
  if (p^.nextchp=nil) then
  begin
    if b then pere^.nextchp:=p^.nxt;
    dispose(p);
  end else begin
  tmp:=pere^.nextchp;
  while tmp^.nxt <> p do tmp:=tmp^.nxt;
  tmp^.nxt:=tmp^.nxt^.nxt;
  dispose(p);
          end;


end;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure SortEtudiant(var Head: etup);
var
  Current, NextNode, PrevNode: etup;
  SortedHead, SortedTail: etup;
begin
  SortedHead := nil; // initialize sorted linked list to empty
  Current := Head;
  while Current <> nil do
  begin
    NextNode := Current^.nxt;
    if (SortedHead = nil) or (Current^.year < SortedHead^.year) then
    begin
      // insert node at beginning of sorted linked list
      Current^.nxt := SortedHead;
      SortedHead := Current;
    end
    else
    begin
      // find correct position to insert node in sorted linked list
      PrevNode := SortedHead;
      while (PrevNode^.nxt <> nil) and (Current^.year >= PrevNode^.nxt^.year) do
        PrevNode := PrevNode^.nxt;
      // insert node at correct position
      Current^.nxt := PrevNode^.nxt;
      PrevNode^.nxt := Current;
    end;
    Current := NextNode;
  end;
  // set Head to the head of the sorted linked list
  Head := SortedHead;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////

    // Main program
    begin
    writeln('Enter the name of the university:');
    new(ptp1);
    ptp1^.nextchp:=nil;
    ba1 := ptp1;
    ba2 := nil;
    readln(ptp1^.name); 
    firstfac:=nil;

    stmp:='&é&"é"';
    repeat
    writeln('______________________________________________');
        writeln('What operation do you want to perform?');
        writeln('2: create faculty');
        writeln('3: create department');
        writeln('5: display faculty names');
        writeln('6: search a faculty');
        writeln('7: display departements names');
        writeln('8: add a new speciality');
        writeln('9: afficher les spécialitées');
        writeln('10: search a departement');
        writeln('11: add a student');
        Writeln ('12: afficher students');
        writeln('13: search a student');
        writeln('14: search a speciality');
        writeln('15: delete a fac');
        writeln('16: delete speciality');
        writeln('17: delete departement');
        Writeln('18: delete faculty');
        WriteLn('19: sort students by year');
       writeln('20: delete student');
        writeln('________________________________________________');

        readln(u);
        case u of
        2:
        begin
            write('Enter the name of the faculty: ');
            read(s);
            AddNodeToList(ba2, tmp2, s);
            ba22:=ba2;
          //  if stmp='&é&"é"' then stmp:=s;
           if firstfac=nil then firstfac:=SearchAFaculty(ba22,s);
           if ptp1^.nextchp=nil then ptp1^.nextchp:=firstfac;
        end;
        6:begin
          write('enter the faculty name: ');
          read(s);
          if (SearchAFaculty(ba22,s) = nil) then begin b2:=false;writeln(b2) end else writeln(not b2);
        end;
      
        3:begin
          write('name of faculty you want to add the new departement to: ');
          readln(s);
          write('enter the name of the new departement: ');
          readln(s2);
          AddNodeToListdep(SearchAFaculty(ba2,s)^.nextchp,tmp3,s2);
        end;
        // 4: newspc();
        5: DisplayLinkedListNames(ba2);
        7:begin
          write('enter the faculty name: ');
          read(s);
          DisplayLinkedListNamesDep(SearchAFaculty(ba2,s)^.nextchp)
        end;
        8:begin
          write('enter the name of faculty:  ');
          readln(s);
          write('enter the name of departement: ');
          readln(s2);
          write('enter the name of the new speciality: ');
          readln(s3);
          AddNodeToListspc(SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp,tmp4,s3);
        end;
        9:begin
          write('enter the name of the faculty: ');
          readln(s);
          write ('enter the name of departement: ');
          readln(s2);
          DisplayLinkedListNamesspc(SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp);
        end;
        10:begin
          writeln('enter the name of faculty: ');
          readln(s);
          writeln('enter name of departement: ');
          readln(s2);
        if (SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2) <> nil) then writeln('exist') else writeln('nope');
        end;


        11:begin
          write('enter name of faculty:');
          readln(s);
          write('enter departement: ');
          readln(s2);
          write('enter speciality: ');
          readln(s3);
          write('enter name of student: ');
          readln(s4);
          write('enter the year of the student ',s4,' : ');
          readln(yr);
            AddNodeToListetu(SearchASpeciality(SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp,s3)^.nextchp,tmp5,s4,yr);
        end;
        12:begin
         write('enter name of faculty:');
          readln(s);
          write('enter departement: ');
          readln(s2);
          write('enter speciality: ');
          readln(s3);          
            DisplayLinkedListNamesetu(SearchASpeciality((SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp),s3)^.nextchp);

        end;
        13: begin
          write('enter name of student:');
          readln(s);
          if (SearchAEtu(ba22,s)<> nil) then writeln('exist');
        end;
        15:begin
          b2:=false;
          Write('enter name of faculty:');
          readln(s);
          tmp111:=SearchAFaculty(ba22,s);
          factemp:=SearchAFacultynxt(ba22,s);
       //   p:=firstfac;
       //   y:=factemp;
          if (s=firstfac^.name) then ptp1^.nextchp:= firstfac^.nxt else
          begin
          deletefac2(tmp111,factemp);end;
          //if b2 then SearchAFacultynxt(ba22,s)^.nxt:=SearchAFacultynxt(ba22,s)^.nxt^.nxt;
          end;
        16:begin
              write('enter name of faculty:');
              readln(s);
              write('enter departement: ');
              readln(s2);
              write('enter speciality: ');
              readln(s3); 
              if SearchASpeciality(SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp ,s3)=SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp then SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp:=SearchASpeciality(SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp ,s3)^.nxt else


              if SearchASpecialitynxt(SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp ,s3)^.nxt^.nextchp=nil then begin
                SearchASpecialitynxt(SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp,s3)^.nxt:=SearchASpecialitynxt(SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp,s3)^.nxt^.nxt;
              end;
              {if (SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp^.name=s3) then begin b1:=true ;
              {tru:=SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp }//end  else b1:=false; }
             // suppS(SearchASpeciality(SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp,s3),b1,SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2));
          end;

          17: begin
               write('enter name of faculty:');
              readln(s);
              write('enter departement: ');
              readln(s2);
              if SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)=SearchAFaculty(ba22,s)^.nextchp then SearchAFaculty(ba22,s)^.nextchp:=SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nxt else


            {  count_sp:=0;
              tmp222:=SearchAFaculty(ba22,s)^.nextchp^.nextchp;
              while (tmp222 <>nil) do 
                begin 
                count_sp:=count_sp+1; 
                tmp222:=tmp222^.nxt;
                end;//calculer le nombre totale des specialité
                
              tmp222:=SearchAFaculty(ba22,s)^.nextchp;
              count_spv:=0;
              while (tmp222 <> nil) do 
                if (tmp222^.nextchp <> nil) then
                    if tmp222^.nextchp^.nextchp <> nil then 
                      begin  
                        count_spv:=count_spv + 1 ;
                        tmp222:=tmp222^.nxt;
                      end   
                    else
                else tmp222:=tmp222^.nxt;
                                if ((count_sp = count_spv) and (count_sp <> 0)) then
                                SearchADepartementnxt(SearchAFaculty(ba22,s)^.nextchp,s2)^.nxt:=SearchADepartementnxt(SearchAFaculty(ba22,s)^.nextchp,s2)^.nxt^.nxt;
                }

            if SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp= nil then SearchADepartementnxt(SearchAFaculty(ba22,s)^.nextchp,s2)^.nxt:=SearchADepartementnxt(SearchAFaculty(ba22,s)^.nextchp,s2)^.nxt^.nxt 
            else
              begin
                count_sp:=0;
                tmp222:=SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp;
                while (tmp222 <>nil) do 
                begin 
                count_sp:=count_sp+1; 
                tmp222:=tmp222^.nxt;
                end;//calculer le nombre totale des specialité

                writeln(count_sp);

                 tmp222:=SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp;
              count_spv:=0;
              while (tmp222 <> nil) do 
                if (tmp222^.nextchp = nil) then
                      begin  
                        count_spv:=count_spv + 1 ;
                        tmp222:=tmp222^.nxt;
                      end   
                else tmp222:=tmp222^.nxt;

                writeln(count_spv);

              if (count_sp = count_spv) then begin
                depptemp:=SearchADepartementnxt(SearchAFaculty(ba22,s)^.nextchp,s2)^.nxt;
                SearchADepartementnxt(SearchAFaculty(ba22,s)^.nextchp,s2)^.nxt:=SearchADepartementnxt(SearchAFaculty(ba22,s)^.nextchp,s2)^.nxt^.nxt;
                dispose(depptemp);
              end;
                
              end;
                end;
              18:begin
              write('enter name of faculty:');
              readln(s);
             // if SearchAFaculty(ba22,stmp) = SearchAFaculty(ba22,s)then SearchAFaculty(ba22,stmp) := SearchAFaculty(ba22,stmp)^.nxt else
            // if s=stmp then begin tt:=SearchAFaculty(ba22,stmp)^.nxt; SearchAFaculty(ba22,s)^.nxt:=tt end;
              if SearchAFaculty(ba22,s)^.nextchp= nil then SearchAFacultynxt(ba22,s)^.nxt:=SearchAFacultynxt(ba22,s)^.nxt^.nxt 
            else
                begin
                        count_dp:=0;
                        tmp2222:=SearchAFaculty(ba22,s)^.nextchp;
                        while (tmp2222 <>nil) do 
                        begin 
                        count_dp:=count_dp+1; 
                        tmp2222:=tmp2222^.nxt;
                        end;//calculer le nombre totale des specialité

                        writeln(count_dpv);

                        tmp2222:=SearchAFaculty(ba22,s)^.nextchp;
                      count_dpv:=0;
                      while (tmp2222 <> nil) do 
                        if (tmp2222^.nextchp <> nil) then
                          if tmp2222^.nextchp^.nextchp =nil then
                              begin  
                                count_dpv:=count_dpv + 1 ;
                                tmp2222:=tmp2222^.nxt;
                              end 
                              else begin tmp2222:=tmp2222^.nxt;count_dpv:=count_dpv+1;end

                        else tmp2222:=tmp2222^.nxt;

                        writeln(count_dpv);

                      if (count_dp = count_dpv) then begin
                        factemp:=SearchAFacultynxt(ba22,s)^.nxt;
                        SearchAFacultynxt(ba22,s)^.nxt:=SearchAFacultynxt(ba22,s)^.nxt^.nxt;
                        dispose(factemp);end;
              end;
            end;


            19:begin
              write('enter name of faculty:');
              readln(s);
              write('enter departement: ');
              readln(s2);
              write('enter speciality: ');
              readln(s3); 
              sortEtudiant(SearchASpeciality((SearchADepartement(SearchAFaculty(ba22,s)^.nextchp,s2)^.nextchp),s3)^.nextchp);
              end;  
            20:begin
              write('enter name of student:');
          readln(s);
                SearchAEtunxt(ba22,s)^.nxt:=SearchAEtunxt(ba22,s)^.nxt^.nxt;


            end;



end;  
        s:='';
       
        s2:='';
        s3:='';
        s4:='';
    until u = 99;
end.