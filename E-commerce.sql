PGDMP      2                }         
   E-commerce    17rc1    17rc1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                        1262    17110 
   E-commerce    DATABASE        CREATE DATABASE "E-commerce" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "E-commerce";
                     postgres    false            �            1259    17111 
   categories    TABLE     �   CREATE TABLE public.categories (
    categoryid character varying(5) NOT NULL,
    categoryname character varying(50) NOT NULL,
    description text NOT NULL
);
    DROP TABLE public.categories;
       public         heap r       postgres    false            �            1259    17118    customers_info    TABLE       CREATE TABLE public.customers_info (
    customerid character varying(10) NOT NULL,
    customername character varying(100),
    email character varying(100),
    phonenumber character varying(20),
    address character varying(255),
    registration_date date
);
 "   DROP TABLE public.customers_info;
       public         heap r       postgres    false            �            1259    17187 	   inventory    TABLE     �   CREATE TABLE public.inventory (
    inventoryid character varying(10) NOT NULL,
    productid character varying(10),
    supplierid character varying(10),
    stockquantity integer NOT NULL,
    lastrestockdate date,
    notes text
);
    DROP TABLE public.inventory;
       public         heap r       postgres    false            �            1259    17172    order_details    TABLE     �   CREATE TABLE public.order_details (
    orderdetailid character varying(10) NOT NULL,
    orderid character varying(10),
    productid character varying(10),
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    discount numeric(3,2)
);
 !   DROP TABLE public.order_details;
       public         heap r       postgres    false            �            1259    17146    orders    TABLE     �  CREATE TABLE public.orders (
    orderid character varying(10) NOT NULL,
    customerid character varying(10),
    orderdate date NOT NULL,
    totalamount numeric(10,2) NOT NULL,
    shippingaddress text NOT NULL,
    orderstatus character varying(20),
    CONSTRAINT orders_orderstatus_check CHECK (((orderstatus)::text = ANY ((ARRAY['Pending'::character varying, 'Shipped'::character varying, 'Delivered'::character varying, 'Cancelled'::character varying])::text[])))
);
    DROP TABLE public.orders;
       public         heap r       postgres    false            �            1259    17165    products    TABLE       CREATE TABLE public.products (
    productid character varying(10) NOT NULL,
    productname character varying(255) NOT NULL,
    categoryid character varying(10),
    price numeric(10,2) NOT NULL,
    stockquantity integer NOT NULL,
    description text,
    imageurl text
);
    DROP TABLE public.products;
       public         heap r       postgres    false            �            1259    17123 	   suppliers    TABLE       CREATE TABLE public.suppliers (
    supplierid character varying(10) NOT NULL,
    suppliername character varying(255) NOT NULL,
    contactname character varying(255),
    contactemail character varying(255),
    phonenumber character varying(20),
    address text
);
    DROP TABLE public.suppliers;
       public         heap r       postgres    false                      0    17111 
   categories 
   TABLE DATA           K   COPY public.categories (categoryid, categoryname, description) FROM stdin;
    public               postgres    false    217   a'                 0    17118    customers_info 
   TABLE DATA           r   COPY public.customers_info (customerid, customername, email, phonenumber, address, registration_date) FROM stdin;
    public               postgres    false    218   '*                 0    17187 	   inventory 
   TABLE DATA           n   COPY public.inventory (inventoryid, productid, supplierid, stockquantity, lastrestockdate, notes) FROM stdin;
    public               postgres    false    223   �7                 0    17172    order_details 
   TABLE DATA           e   COPY public.order_details (orderdetailid, orderid, productid, quantity, price, discount) FROM stdin;
    public               postgres    false    222   M?                 0    17146    orders 
   TABLE DATA           k   COPY public.orders (orderid, customerid, orderdate, totalamount, shippingaddress, orderstatus) FROM stdin;
    public               postgres    false    220   
I                 0    17165    products 
   TABLE DATA           s   COPY public.products (productid, productname, categoryid, price, stockquantity, description, imageurl) FROM stdin;
    public               postgres    false    221   X                 0    17123 	   suppliers 
   TABLE DATA           n   COPY public.suppliers (supplierid, suppliername, contactname, contactemail, phonenumber, address) FROM stdin;
    public               postgres    false    219   �d       p           2606    17117    categories categories_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (categoryid);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public                 postgres    false    217            r           2606    17122    customers_info customers_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.customers_info
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);
 G   ALTER TABLE ONLY public.customers_info DROP CONSTRAINT customers_pkey;
       public                 postgres    false    218            ~           2606    17193    inventory inventory_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventoryid);
 B   ALTER TABLE ONLY public.inventory DROP CONSTRAINT inventory_pkey;
       public                 postgres    false    223            |           2606    17176     order_details order_details_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (orderdetailid);
 J   ALTER TABLE ONLY public.order_details DROP CONSTRAINT order_details_pkey;
       public                 postgres    false    222            x           2606    17153    orders orders_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 postgres    false    220            z           2606    17171    products products_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public                 postgres    false    221            t           2606    17131 $   suppliers suppliers_contactemail_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_contactemail_key UNIQUE (contactemail);
 N   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT suppliers_contactemail_key;
       public                 postgres    false    219            v           2606    17129    suppliers suppliers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplierid);
 B   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT suppliers_pkey;
       public                 postgres    false    219            �           2606    17194 "   inventory inventory_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);
 L   ALTER TABLE ONLY public.inventory DROP CONSTRAINT inventory_productid_fkey;
       public               postgres    false    4730    221    223            �           2606    17199 #   inventory inventory_supplierid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_supplierid_fkey FOREIGN KEY (supplierid) REFERENCES public.suppliers(supplierid);
 M   ALTER TABLE ONLY public.inventory DROP CONSTRAINT inventory_supplierid_fkey;
       public               postgres    false    219    223    4726                       2606    17177 (   order_details order_details_orderid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);
 R   ALTER TABLE ONLY public.order_details DROP CONSTRAINT order_details_orderid_fkey;
       public               postgres    false    4728    222    220            �           2606    17182 *   order_details order_details_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);
 T   ALTER TABLE ONLY public.order_details DROP CONSTRAINT order_details_productid_fkey;
       public               postgres    false    4730    221    222               �  x�M��n�0���S�u���-�C��α�\I[�\�?v��J)ЋK�;��:=��9�R.�%[ϔ��6� !�&J��6g�2i�;�p���B��5r�����J��L�bs3�T)�"{q@�gK�aG�3OvY8��mB�h�t��k9)�1+-��Z��L��ș�ln3����egߛsͶ�oZ�v���0�Ӥq���	%�����\iȒ&4\g�;���4v�s���*��f��M+��$U�n�;�����6i���wP,\�m�����+�՜���A����ڽ��'�.0w@�W��`HRWT
|�ҋ��꼃?��k���}�~��J
+����:��ó�Ej�Zư�I��a��<Gu�Y�&,�͠�nhסI�a7��)����B�@��M �e#��S�4��,�NYo��$کKwݓ�I���Qo�۲�o��e�ފ��FU�m�p^�>�io�x4/3+��/�i�1
Y�#S1ì��1s"v� $/y��[�e������|^�<"���<jFȁ�Z׉��n�������c�vE����R�I���L�ͷ�H� ���k�0��۱���XD�Ѡyg�c4co�dI_��̞�w�m+y{��DArFI4`�����|0��߁MQ�5x,X�k�$X�Z�Ǜ�>����[6�J����;>��         f  x�uY�r۸|F��?��(Q�7�J�l�,'�Su^`&i��HY��~{p�E���ʪj�t�􌶿v��i�~p-d�=VU!��%�.ꦐ"Zr��s�s�EY~NT��p�X.��*o"U��?��u�d�;�`��l>��'a�ik^0c_��l�Us](V*] ��:�*^ذ�b�Z����Q��k���ZNfkξ�"��C��Li�$k���W7q�s�L��j�f�yQ���(�(G��M�+1b��ő�룖�iX*�u�y�Ǜ�|�~��Ƀ��҄�&�t�P��r����e�HT)�����M��2b�7�S�R4�@a8��(Kv]��	�^�s~��N�[���_M�g|��##�b�d7�X��t8��vW]MB��۪��+܏�*ɛ��p��4y�?gs��&R���,],�u�Xk���i��]Z��[$���z��2��hw<�7J��ա��R�*�]�ۖ��<��N(lp��IB]Q�%?�M}V��������g^�3�ZL��$\�X��]9��R]��0Qǧ���q�ZW�E�����]�%�D�h:d_Q\"K�Gi�O/�n�|lJ�}=�9�V���.R���t��*QwJi�J�;1 ݌8�L�����k1�1��t��x�k\����
�B��^�2~�\��B����e+��aҠ.8��K�/�4��D��!e!�U�U�1m�{��@F��E�;T#�'n�`���&q�=[�,��u-iw[�6��IH�d���L!"�Rc���>`�w�KǃQ�6�����]�&W�vI~,�3�@�,ΐ���*�+���(k���"cD�C�(���$�W�DZ�{����[yw8�4�2otɫf�aJ"X�%T0�C��a>N8�,Հ���Љ�Oթ����:�ں��Du�)��U����'�'�g�oR�6�F���l\Ȑ}�C$�����E+�W�xz����(�:�\?�?��]����^��W�UZ 3�TQQ>+�y���%?�a4ͩ�ln�;�C޲c)�D��ɞ%�=��^Y�����[l�9��&�u�{Z|�笩DUK��l��R^�Y�ѸB*�z��A���"�cD�*�]��D1�=�'�S��}6:S�s�0�V���
'�&�|��E��M<e�*I�0�tTPC�o��6��G"�F�p����(]:{�$jFD��4ٍ��N"*�ԉ�l�F�4�8y�*��(���&�L�	��\�e�령kx��"F��S4:�����	k��|�e�%�i`.]dJ�H�C�;�õ��&9�)����S��T���h�	?���]Q��u.{��Y�ɩ�R��d����M�.f�KMp��t��,��)� �����`�H�z..�������i�H0L(� YpZlt\���s�đ�a��K���gnaކ�?�`0�|\��+
@rp�s˾3g	\�Z;r2��I��� ϭGr��QLm�#a����ì7��k/�Z��y>����ǭ�s|��������e�� ���q6�����|��oS�Z���ļ�:�#�$�x�9���W5�}��򨍦�'�����W��u����Ǜ�G���m���s�u"d�;9W�(d��5G_}�UJp�d+O���1do1�{�����a�j@��c�-�J��׹թ5�.��[����?���>jNT!+fuw"?+D��x�*y=@Zu�Y�u���~�xԈ�b{^F� <Z�$�f�a
S�DGx�r�n$����Y$��'���<��"Zzi'7x �%j�v�5�I��i���	Qȍ��v)=j~�?�{��V{_2KZ����UU�:� ��+ڗ��{h��5�Ƥ;�ͬ���>|ͅ��c�<����h���0��uO��ִ�^�S'zP���Z8��b1ĭ�PQ�:�Gw?�v|�Mg8!|V)�ӳYfP�k������1Ҧ�pՁ\w ^�\�٢����ٟm>�f����]!}]̑�N~�k�P/(��g1F��F��Rӑ��*��1�9N�*1�^��qC�bѵ�{ �NF�>��Agڒ�.�=�|2wB�Za�&D ���y�U;�c��1����:�.V��/+$i ۰�4ZƮAL^�[\58�1t�1t�v��$��	�E�
�Y��$G&ꞡ�ZOf>Ʀ�-�5U�uF0o4�ʣx��ON���'L�+kؕuIfM_4�լJ*$�ƾ
#�n��pE���*M;��'�e���3��n+��<6�;��Ou� A��N"C����h�z�%�	�'����1r@v\�e���5w�v�`(�8G$k��h@Ә��i��E��9�t����#Mdֹ�0݌V�um����o����mxN,J���L� �~i�<�q4�^�btٹާ�H��|/����OJn�Ә�Q�<Q�خb&ٯ���A�i<���\�[��E�Da	�
�������8ƕ&�C�سeo��x+���wV�1T]d��%EpW[MGڷE��ќS�*���6^��Bv�G	1��"�=�i��
Y��B�Pul��qQ&O�Ռ]AQ�"�ԙ���xҐЎm�|8G��}���@��[*ؗ� XUɮ�v���.�z�*BH��K瀯��-�qC�4m,��������p �9���\-���1)h�jb��(y�m���@H?u��Z����W��b"N8��8Wf��|�7��]`sn��Iܫ�9�G;�l��+�C$ S�GB���>��`s[Q�vg՝�����Ƨj��R��m~�42�~��W���K�0n!� g�;O��/�\YS��n���uh�edv��7�Vivf{��n�c�i)�ր�_�R�\�F񡢡&>�f��%6�s#g�9�/�{�%\ST
"���5?�m�[E�V�*#N��5}5�D`��ӏ�-�_��-x��(�n�h���>�l�C�z�ȩn��)�����R_��NN��z��+c�W����y���{y��	S�k�YA��a��xf-[_�⹵^u#ԃ����(>��~�v�6c��S��_ ����Ҋ��V@2|��WܲL����Y=��5�d�������0�*"�Y���/��4���&�^�����Μ�`�5������#�䝙�V���a"L�=N6!������ fV
if����{������?�J}�N���73�E�(pAA�w��r5*�[Xv�p�%k3�v�4<�?�m��ʾE�K�M,㺠�����v����_���2c/��+�In�g��Jh������St��Ju6b���vS2�_���sm��L�����`|�{�)�K*�٫�'>в-ُ�禨)'��݌���3(�������_��Gy���8����D��p�A3�a�  S#��*^^����ڭ6Iw,���7I�ԯ5��ғN�j�}�)x;
�����O�>���K�         �  x�mX˒�6<s�?����~��T�8�W�r�H��E4 �����  Wpr�(y� f�{~����!M����!=&�xH��L�$;d�w���,O>.bnY'ǉMO�zz��lYÍ`�����N��Hao�Y�o	=���ɡg�$?��证#4��~��|LZr��wB8�ɱ*��_#�Ȭ�� ��/��s���j8�lՕ�6 ���̓��~�3~��x�3[F���|�1�he=�K�����. �8��<��w�o騏R\Q�Us�xY�6jƆ��f����U�ק{�����2
�J�f�{a,3��/�b�F5�=��:�3��"�Ec��y5ǃ;rϟ�U�4����r����b��{�O[�E�f5ݘ0�U㍙A���-;��}]�H�Dا�YO��H�c����
Аz����h�:[9b�x�W�k;�o����
6hZ�j�����*�N��⢀\���e��Uu�ex�¿�jT���q,�-�8�*/=�1��HU?�3�L�=�d�W{���k�����Q+���� -]'U��C� �DT��No����R!:��(,�e��� ���P��p���͈�c�J�|��j"��Fh�匞����X|�x�"��� ڑ4Ө�Y���N��ƕ�]Ÿ5+��HQ&u,�[��lv԰�j��X���^� ԕ[�,:��l.8<`�O±���X��]'4�+�m���Z��E���c����<�F�[���~f�h�މĕg�+g11_��.�O
����Lu���L���j�c��$`9L���l��!����B��L��@hZ��#��6�[�Ә��]��'{^V��U]��b�H_i<�����6fUY�Q*�&e�����4�1p�3�3��t����ﶽͣ���b�8F�!� �æѽ�M7����I��ц-Jx���R�d�N �W8�	�ɂp2b�HQ�C�E�d�i��A-�&Gn|��I9v��{�Q��L�R�mS5��e>����V�k�נ����c8���6(+������`_:f��6h<��{���w��5��$	q
hBX%�-O7׮O��?�,�d+����n-'�,͞9�@���_~�u����N�����rI��� {���#�D��j #�̀$@�(�)� ?��	������݉6>	q	i��
i���{�wM�r�
����f�~�c�F�V��(v�3��9l	\Ggf =���E^���^�m��h��X��Ʈ�ѳG
��MIGE��`��y7�b�Ϫ!)�f��y�ZQoYU> HAh��&�3�y#V�ln��J�ˇ>�f�v���,{~B�z�P�,�Q��B����0�(r������Ҳ�ߑ~�:At�a�ا"�≄*Q*������NeW�2F0"@֑2 y����?�8��Y��Hʹ.r4�KZP�hȓL�_TH~��&�y���ǐq�l�W��7�N�^�d����Fb�R���z�}�G.��]1�d����/D.�l�WW�!A��Gs��V���h	���E\i�H�AQWe4�>�7�G.G�8�7��r-ў�4��ن ^|��8Ee|Is�O[�
� �wt�҆�"�=�Ƭ4�Vm�LV�&��Y�\��]ai����>��hAv����]���r�E�+l�'�0����}�2j�-O�])��ʈX*��y��h>18�޴b����y����1��l��SEd�"�݀���P���tn>�1�T+N��F��gC���xT%�:��Kpd�\?i'�ﲝ��(�sKv���m��~��Sq���R�i�ǆ�T]4����?f�X��P������QT~�{pN-��>��qa �x�-�%\M�&�,|w�C�\���6B�����+�+��V�h����y��z����������         �	  x�mYK�7\�;̔��o�S^���H-i���p��h��y�������W�����o�9?�)���<�-���i6����g<���7���Mq�1i�������$a�n�m�OQ}G�wf���'ӟ����E?�47�%Lrz�SD�f��9l��h
�"�ɚ�j��6#�Y.�'?��[-�D�.է���f]"t�G����@8��Y�B،�N��@��9n�V�T	�@�Am@''x��S�	��'�F�_�K������7��PiWT@���l.�(	����I��'<�		�۲�O{�����0	���K����v�`�+<Q���j��� g&^ �sF�(�q�%�0Ԓ5h"Q�9@n�p4ψ<G>s�L�9����.e$k @��"��	���tJѷ�;)�Ɂr���r���z�+ߵ�n�6}���D����@m���mJ����P��N����̉��0�[��0�(�b���/�0�ʖ:�#c}�0���x���.���B/���y����.a.o�~����OJ��.�s	�3�a�G:��뇱�}�\��r~S==��\�[�d�XT|�r��3�$�JT�ʽn�A���Z�j�<�Ζ�����9�[��ˍ�ÏΩ����df%�y?�����z�6soAw����:.���	�S�(�ӥ\�����̥�w�a���R���h��]��pa���j8WL%�|����˹03�U�!��K����^�Z|����q*��z�$py[?)��sY�j>g������qa���0{e��k�<�[�iĨ`X-]S)�Ԃd�I��nh{c��׌����4{>M�X��(�*�>��iz�l��ft9�0"�-@�z6���L*h��k
��a4�LY:���ӌ,Q�:>���N ������e�F�٢J'�w����k~�p:A>��bƷ�����6�����ٝ:W9�sB0��N����!���N�^3 #����!ȋ��9�N�ޯ��/A`ڕs��W�%/S#�z���<e�����G��Lg0M�%�\,�񀔎�l̣����Y����Q���'0�G�;�`1�]���*����u���Z,�}�˟T} �`o.�����Q�;�����ٺz��m�%b�k�N>MP�c��cY��n�M �e�h�S�"�@Ͼ���2��C�g�j�X2
�R��F�ÉƂ0�Ǥ^������ٮ����=XA�x&�Y6m Ea�̀��mn�b���kf�"��j����ؖ�ճ�gZ���C>p/��;�v;md]�`�<V�gq�tF�z+�T	�������/�����x�#i���R�I��ߊZ�){��]�{��to�ɶ�a2��S_�tڰ�Z@�&ɤ	�r��aB��>�}遌��0@�[��ݐ��%����.^�..as���R�>�����NWخF�iע��m3��M���/��<W
����B7p�EU	μ��wڌ\��ʿ}�h����џB���A���W0��r�
yD���i	
�����KF���) �� ��<G� �����[��T�V���v��V�|��b�d��J��[���.�u�派4��@�.�����%������=�J���99�H˼@�;�Ƹ�j+1�B J�1V[a�A]D2,�?=z�ʕ��(B�?=g
�1�u���O�ι���Z�/��U�h	;*An�C�K��/+�>ǒ!c	_/��s�H6���߶�á��B���\E 	�B��KeW<z=��	���ҹTct�l�!�[�>�|:��O���;v���+z��4i�gʿ%G�-�
Y������~�R��>��+�XRMڍ-}��oI;�9j#Up��O�����dU�5��ʿ��1|�$���r�]����|'�^o��#�f��"TK
$��	�ڂ�o-@B<,wG�z���:�*���{�P������U��/�zv����j=�j��ӏ�K|�p3��֯?I���h�/�"ٷ�8xp�R��oF����B�J�`����
匥v��%�A#'�݌�%N�eRBX�����B�;�^WL����	ِ
pU�o���CN�T��U�In�d�~ߌ��QJ�d*� ��(~�ʐ�����ܵaT��?���]%K�#p\P�q��U�~��"pM�>�^�\��]?vs�Z�V&mP�����U�g���1�%���W�����>�gj�=
��،�?�\w�d�xl�~�d{Q.��ꇮ�%>�>�S�OAlY���/�J[�|:�*�5�L*��p� ,}WF�s���͸� ����\�k�/��4Q���K��{����sc�OQ�-�.�ϚbJr9��s��&?�L����bԜ��������U[��e��߾��V�!qf>+1埌�O̷�CJʿ�z�"t,�C��,Ъ��q��[���l?Н��/�N����������?�+y         �  x�eY�Z�L�>v��/���}9d	YX�`���gNX#1��s��[����� )��߭J�n�8���;.�Br���<�baL�DXx+�dwES�9��o�K�����hv�[�d_Θ����i^=�m�����ʮ�u]Qn��]o2+�{v��5�[m�_��`��%�Y�;v�7�%��Ȃ�N/Ίm��C��+��xb���dN,4���S�;Gi;~�eL(�d��eS���~�鎮8��ڔ//}m��!��p!sf�*wLz!�I�s6�%;��ƎoXp"��MQ���+d�BJ��T�T&��fw�z�n�yY�K��ޮ��h�p�KƅQvz.�ʍ�r!B���:��m�7��&�;��_��B]��|��3��=�K���<z!��8_X\�պ-�K��񷮧��n�f�N��o�gKvuͼp����G��#ԑ��6rq�:e.H���5��%���~d��&�´��"��ef 1eا���o�?��7;t�W޶��)P��qp�S��´h��-��T��nk�Ύ�4u�;=~�x�k��'Nwh�5�_��x����b֤� �˼^�$G��%�>m��E��l��&��;�#'�>tT���.�k��pk?J\��wє���Q��	��)�D�.7V���.�RD
��K�(p�pO��Y��&@��娫N�L���U}ů>���}Λ�����m������0��������N� (Y�B��(I���&^; �Ńe�r�>bӁ�o�]�v��we�� �@�G�%W|z�PNM�jי�cE ����W���eN���?$i:�d>��A�8�����P*d��7����l{���D;��&�M5�����jC`�Y0��R��QSq|9�S)�'�.��@�e;!�d7��)ʜ��x�!�_�|(� �1��7�*�X��@Qt�	�A5�t�/����M����ds���ݕ0P�h��A�{��21J�AdW�3���:��/�����o��N�P�s�ħ0��S"M���Wl�P�A+|��X�'�Q��Td��n�N��j��~F�>)����e��t�h2�p��fj�8�i�&�Z��b����&5��z�B��)%�3�;�|�����a��6�%��Q\�kݢ�I���1i����D� �MB�@(|���|��z(X
 ���bH0� 74��J�]�@��U����=�����P�p�;�BԪ�1gg��7'�cpS0d
�h�ʷy�����b��D�7T�Z��'���Q^�`���	`�;>�@�M|�A$�C������@�6�{��դ��o7����p��\���L�f��pJ�:C_�	h|���5N{�W���Vt
l�6��磴	B����LH�>���Y�Ӷ�z��l����0p3;v�$��@m2�D)�I�u]����yC�UB|p�N�.~ᣤ�]���̈�ä3�~�]�HY��U���h���>Gh�~�U� ���,�T�w���O��kOx��Q�LçJt�z���7�$aW���FSM����<Ҩ�sR�dR������S&Ă���.Ȥ(p����Ӑp� F�?w��4#���8��Rq�Ί�&��7��@�_����<�aCl�׉\N���3�%l
��SJLfi�u��j1�O�����;���dR�x8��|����i�D*9�tt<�3�3k;����jPG<R��ޛ��c\0�ƸI��,!G�E��ȌX(�k�����:Q3H4#��NO���L� |�,����ovY?�^F��P��II��-qȻ��8�.
�U���.sv�o����5�y3�X�BJpvj:1*���0ɐL�q�z�s&5�&���h�㞺z�/>�`:񌏚����{SN�� �({�1��L��4=���&8|P���	�U�'vQ���j�NcbH�+3�0�-�V��l�E�!o�0�%v�~p��+��|tL�UP��@U���s�L��-�9�X�7v��]D<9�u��{����H�0�jv�-��	���)��M�~�}\���C�t�$Ɖ0���4�Xo�b'h>ત�9BN�>k����I&�'�,L�*����p��U�DQ2M�'MA�v��Sh����{h(g���ן�����#d��"��0���s�1��b�Sb�QY�IZ4�t��f�
�z��*�C��F�%QЏ���x�Z�] ǡ���v�H��#^P��81/�y�r�'����z�P�5�kQ��C5�p� &�j��^Qf������}�V�
Gؠ����}�:�oD�Vqp/��=_.��.�Gw���t�� &$���Pm' ݕj�﯊'M�#�>�]�.pl�!ń��}F;-E��&���nH�u���՞S�b�|����TG���=Ș�R��"��iT�FdHEcis1��19�MϚ����9ch	��t����J��(�����_��Bo[���BkM ����愞��ճ����%�y&�+F���-a�����h�Y��p�I�DDcF@�P��q��$�Ǹ��*L�`�Η6qN�Q��B;O��P�}��(Mt��cWD��W���_9��u�}�;�{�h-�z��D��6�w�mX�kIL�^`�M���6�Р3m�P��"L1P�$t'M�W1e!�����>c�.�ke�;�����"
^�b�1zL�j�>R���s�R2��J�T��،���^I�] ��#�e!��F�pf���Ap��nn��Ym||,('/	��U�k�@h<��w��Y�)A�a�Y��Т?����#�6��n�m�~��$a ���͜��!S8�4z�E4���?�]v�g:9�8+����gݸ��f*���,s�WÔOS�I}X'=���@�I�{t(��˸�-���L���vH��5��Yٞ���L8zEA�,�׾�4{ѥO+�U`Y�Q~���/�Y�}�^�z�L���>!�3�G=P\��oݒ�N����
s2�DF��+��&i�,���4�y7h�vB�7��'�;À�@��'F�z���4�\���c�}έ����͵��7#��q�x&����2�=4�Cš{rP�h�ɞ���@���6-�д�T#�"�n���l�#�T����cL!������͏O�2�}�LK9Cx�u|�P��������ct|��}�.2Ǵ�a{��ME)�O��W���3.�|���Ի�Th�q�PP�t�?piR��C�����1���^Pb�+TʺR��-;�Ը�;"u�Je�է��Wi��prb7�x�#���ڽ�s`\kB�GF"8g��m���5�"+q��c(���6E�~�G�~�d?����B���ó����yβ;�̧[k�rH/Yh.O�u�Q����$$J�qՁ�j�h#e��{��;�E^�%�@��8�n��H2���{:`����s_=�ʺ��`LC,-��$�'a�~���'�vŠ�!ZY ����H}��(�]�E�_[��;ٸ��_�F|t��Ѡ�����2��R�����:�Q�����B��qT�KHc���K03MUq�nD�TZ(5�6/i�>�txwQVt4Frr�e�;kD|�B\�B���ᇖ>qp���5����{C���]��x�,��,�ư����]��i�?0�!�)�8;���N�[jы�mӮ���!��K�������I,C��ڥWVQ�{MQ�k��f����g+���}R�E�q^킽"�#U�@RHj#$��}�����t�x         �  x�}Y�v��|�|��%o^ۊ}��묜��9yCb� �I��S���m�A�DR��������{���xҕT#޽��"�}/D���-�8�?��d�9���r,��&3N��
*/5^�����#��z���o�]ߨR��蕶݅�.ϒ��7_��P<�a�s�H�q楁2���R�ޔ�<hYY;�V-{-=j5����'M/��Lό���<��vv5��bZu�|z����Ѹ�mL���Dđ��"�t������>�N�7��B$����J�l�]ڡ����T�"qR;wfZ� �wqz��X|�*�+�A�z�/�X�v8 >������W�2�J�� 7�r��Q79�����Pu�{9��F�j��H)%v0�~��<�I���^� #,|/DJUk��V�<���q?y1Sm�I����F)��������]NNf�t��F~�+�����ϸ%��/�c*��a2�ܨApi��Q���X�	{�5
�D����$S�zP�"JQ�����<f�5�t��a"���E��"���k}Z�M5�dg`fҪ��9֓�-��zQDdX�hƇ�U�a�$�Fy�Bʑ���	E^�$!x�jj8�	%r0���5U����b�_H"��c `�VS�0'�5�|wx!>�ˢw~�^��xW[��:/�R��&�G	x��~^�$��#�<(E�ǻ$�n� >�M�4� ��W�.��C�
�!���;A�o�f����MW"���1� g���87	����x� HR/*@N�NM��;���R��:�����!E�!�Ќ��٪� p�F .	F�+�}>�I���ȅ�_t��Ʈ����E!_�-'s���G*�����H�p1	@�����-����5�ն7Wݬ�I�]��.�H��op�d�Pn������Zu���^e�p����\5�L�GG͢2�hE��f�&�[UU�]}8�?@R�Z���>=�m�����C�JT{ !���i�-"CH=�hd������Z �R_�~tź�'<.Re��wt�aO�O�� =���ŷ(!-<S5�~�3��R��3��x�ZKg[S����^�a����5)M�8�䁗e���j&K�1::\Oz9�8k��_��$�)�Z`�Koz-y�b�f��7l:1�K��_p�G��iԾ�Q,EJ��I��@��ʲ!�M �	��Ns㝏�|�w�jJ���X)��&����h/^$��K2�'��q�<��h� Sc&b.����������>yp'0��� ���>M#	��t2:z(K��d.ɏ�j�P D�	#'���pV�H$���+�F�h�j�(�\�l>���
�AF��Y���jb"�+r8I�/=jA��̺ѩ�,KȢ��4R7Gc���<s-H�]��!�0WQx�_�'��Ԅڅ����B�FW��GC$��@c�)܄i"�w6x�h Q�Fu��,��]�n9�T/[�N}��0���*�n�0���B�D���'ll�t���g"	Rt-�:a$�OP߭YA���7�bĥ�~�tߌȁX!�Ȟ����>�R �^4�5]����.��m��z��a�%�Hbtr �L�^1M��Q4&�*O��9���HYjV�('{A�磈�R'��j��a�uz�P�M��"C���Wt�e���C�e;$o�򜲡�q�xx2��{5)�P.�j&%�l����ˢ_�z���<vge�m����Q�Y
񄗠���]a�ZJ"�f�'h�	p�p���>�e�� .�L�Ng�B��{��!:m�e!_V���4D�{X�O4,�s�Sp��F1	���S?���Ξ��"�X_`,ո��&^�d���W��2�"U�֞�.r�0��tE�;�'�(&�h:�R��jCOfC�;��
G[œ�+�1X�f�6�!��;���Y;g�~�/Gq��D�"�c(����E�ڱ��V@2��^�/�4�lW�۬G�qiܦ�nn�zx��г��;�c� o�A�S@��o�ꥶ��Z��ǋ�������,�3$�4� ���"�$­s��G���`c�Ӕq�O��c*����\t���=�)��_$��7����g4W�z,��b�kv����e�|��v�v#4�>�-2d���(ƈۯ���y�����������4��_]������{��j��n��^פ��>���_�����g�3Ro�&������y�;�vR>�s�:O��L���I�o^���V��c~�]�j�.�͖��r�����Ty�8	������BjH0[D�Y��uh%��2��v��V�hQj���R�t[X ;��
�Y� V$��-������p۟ўB�wZ��(�����Z�G�6�S�?w�q�q�:B{�h�_�ƪ�#�V��V� WI��/��~H�vb���̿W@�//x�f���M^�?]�8��|U3_��*�~`���%Y�{���QY����}8���uG�I+Nh��}1�̋2Pt�5�$?����l�M�;��vt��7J�ӹ�H"��U�xy.0����!m�$;��ܤP��:2>��Q��d�/�w�.��>q(>+�5n0�#��|�%�_l�t���k�aE�i	�ؐw̿�jNPӳAމdԂֱf�p�ԥ44�
a�~�_��ׄ+��]�� \�s�mrcBQ�P��O��Si&�k+��Z�'g6D��;�{i�*�s�����V���BU�!i����i_�(y�L`���vJ�^�w7@�1uclᑻ�������}�:��-u���+�/1x���h�O���D|��ے"��I"Q��v��YVf�5�>�nnn�������Z�hi��u֑���~���`ۅǩ��vd�Z`d�e���6M���A�h�4�#�Q3�4M�
c�b�i��h�C�h&N09w��8����50��r��fQ��k���OVU��2�cح��e� �$��ζy���͙.�\<o��=L5����^��mк�(��U�a��.��"��Y�t���3���.�\������lK�4�z!eOt;�5�$}������ɇӡ(�L�) $��o�W���1Æǎ�	��19��sӃ��R��<�a�{���8m�N�~�3/�.�N4	m�SG���~���?L؍�����͛�zH�          ,  x�UU�r�8<+O�=��X��8��'�83��ڋld�XHY����T�����u�6?�A�WmjgIڜ6�����*z��Y��L����sW;W�4�����MS�#-uQ65mZ�(�	�ТT�3���6JD��Ŧ��Jz�N����d/r��Rҵ�VxU8�q1�.��h��AZueUò0ϒ���ޕ�uM�抦<T��Ji��*_��e�4#2g��R ��K骷O֭1�]Z�V�tg�W5S^�`��50�<	Y�qA��{��µ���H�	=�J�{�	͟q� ;c��U#wjBw8Z����UH67��*O7mnT��]ٚ�T�JZh33�%W��K�dʂ(�g$�{���1�I8�:�l��NhuCI�g����Y]B�w��G��RV��a�	���c�@9d"� |�,�o�[mp�zBk�թrmS*�0R2b�l�L�k�أܹ-�(�NYVi�YQImF/�8d<����]�|Mw��͙Ķ@���u�~�"1a6�L�/y���ǵ�ڳE)�Q5=�r0���]�~1.P"�s�]V/b�'�����삭�?|������]�N,o�Y9},�1I�i��
2�] �F��V��,�닳2x�Ҧ�����[K�R�Nۼ���� X��TZ�ʵ��F�����9���	==P��q<����h��w�O�tt�G���(�<V)�`�"aIгR9]�}vz��.[9$8��0w�g|�MξK��G�{]����O�tV���4�9��Czn�ZCxr�m��� ��8�������`�k�ySv�C�~U�w����ǀ��X�شPFBZ'�٫��R(�Y�(��yl�A�:��_�V�n�}�[^<�C��~���^��� ����ȋ�\Sv����0*��ƠP�~���Z'tsK8)��l`�2��F�q�V���䬐[���/9E��i�	Fj�11��z��I{��i�#(�@�b���ahs�T������Y��b��j���s�&1?ちV��"
�@�){p�x��;`n7}7�;(����g���x0���tv�P	�!�toPV�_��n���~�$��#Ԕ��~H����{��(^e�*'lSs�ք���B!`ƾ���g�[xy���~�;��ƍE��j��.���f��^�W[}��#Ă�#B�����>|��e:�8�ux��q����!cC�3��)���NBpL�e�V�s]���0��D�μ��հx�,bu����/��N��n�U�joJc1���z��D���w}6��������]�)�����...���#     