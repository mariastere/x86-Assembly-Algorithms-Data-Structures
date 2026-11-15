Task 1 - Sortari:
    -pentru fiecare valoare cautata parcurgem vectorul de noduri (folosind un contor ebx si un pointer edi);
    -verificam daca valoarea nodului curent este egala cu valoarea din esi;
    -daca este, adaugam acel nod in lista;
    -pe masura ce gasim nodurile, ele vor fi conectate in ordine inversa;
    -la finalul acestei etape, lista construita este in ordine descrescatoare;
    -pentru a obtine lista in ordine crescatoare trebuie sa o inversam.
    -parcurgem nodurile deja legate, pornind de la inceputul listei (eax).
    -pentru fiecare nod salvam urmatorul nod (edi->next), modificam edi->next pentru a arata catre nodul anterior si avansam spre urmatorul nod;
    -in final vom avea lista in ordinea dorita.

Task 2 - Operatii:
    1) Functia sort:
        -pregateste argumentele pentru functia qsort;
        -apeleaza functia qsort;
    2) Functia comparator_sort: functia de comaparare ce compara cele 2 cuvinte
        -extragem cele 2 cuvinte ce vor fi comparate;
        -calculam lungimea fiecarui cuvant;
        -comparam lungimile si returnam 1 sau -1 in functie de ce cuvant este mai lung;
        -daca lungimile sunt egale, atunci le comparam lexicografic;
        -la final restauram stiva;
    3) Functia get_words:
        -parcurgem sirul de caractere si ignoram delimitatorii speficati in enuntul taskului;
        -cand avem un cuvant valid, salvam un pointer catre inceputul lui in vectorul words;
        -parcurgem literele din cuvant pana gasim urmatorul delimitator pe care il inlocuim cu "\0";
        -procedam asa pana ajungem la finalul sirului.
    
Task 3 - KFib:
    -salvam intr-un registru pozitia termenului cerut si in alt registru ce fel de sir Fibonacci avem;
    -verificam daca pozitia termenului cerut e mai mica decat tipul de sir si returnam 0 in acest caz, altfel daca sunt egale returnam 1;
    -apoi vom folosi 2 variabile, una in care retinem indexul curent de la 1 la K si alta in care vom retine suma valorilor;
    -apoi recursiv calculam suma termenilor anteriori, conform formulei;
    -dupa incheierea buclei, mutam in registrul eax rezultatul final al sumei.

Task 4 - Composite Palindrome: la acest task am reusit sa fac doar primul subtask care presupune verificarea daca un sir de caractere este palindrom.
    -vom retine in registrul esi adresa sirului, iar in ecx lungimea acestuia;
    -daca sirul este format dintr-o singura litera sau daca are lungimea 0 acesta este considerat palindrom deci va returna 1;
    -apoi verificam perechile de caractere: priul cu ultimul, al doilea cu penultimul si tot asa;
    -daca gasim o pereche care nu are elementele egale returnam 0, iar daca toate perechile sunt bune returnam 1;
    
