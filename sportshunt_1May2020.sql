PGDMP     /                    x        
   sportshunt    12.2    12.2 *    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    25636 
   sportshunt    DATABASE     �   CREATE DATABASE sportshunt WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE sportshunt;
                postgres    false            �           0    0    DATABASE sportshunt    COMMENT     [   COMMENT ON DATABASE sportshunt IS 'database for UML project for storing relational data.';
                   postgres    false    3727                        3079    42440    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false            �           0    0    EXTENSION postgis    COMMENT     g   COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
                        false    2            �            1259    43455    divvy_stations_realtime_status    TABLE     [  CREATE TABLE public.divvy_stations_realtime_status (
    altitude double precision,
    availablebikes integer,
    availabledocks integer,
    city text,
    id integer,
    is_renting boolean,
    kiosktype text,
    landmark text,
    lastcommunicationtime timestamp without time zone,
    latitude double precision,
    location text,
    longitude double precision,
    postalcode integer,
    staddress1 text,
    staddress2 text,
    stationname text,
    status text,
    statuskey integer,
    statusvalue text,
    teststation boolean,
    totaldocks integer,
    where_is public.geography
);
 2   DROP TABLE public.divvy_stations_realtime_status;
       public         heap    postgres    false    2    2    2    2    2    2    2    2            �            1259    25997    ticket_orders    TABLE     �  CREATE TABLE public.ticket_orders (
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    event_id integer,
    event_name character varying(200) NOT NULL,
    ticket_price real DEFAULT 0 NOT NULL,
    updated_date timestamp without time zone DEFAULT now() NOT NULL,
    ticketmaster_event_id character varying(200) NOT NULL,
    order_sports_name character varying(200),
    order_city character varying(200),
    order_date character varying(200),
    payment_flag boolean DEFAULT true
);
 !   DROP TABLE public.ticket_orders;
       public         heap    postgres    false            �           0    0    TABLE ticket_orders    COMMENT     �   COMMENT ON TABLE public.ticket_orders IS 'INSERT INTO ticket_orders (user_id, event_name, ticketmaster_event_id, order_city, order_date, order_sports_name) VALUES (1, '''', ''random&*String!2#$#'', null, null, null);';
          public          postgres    false    206            �           0    0 !   COLUMN ticket_orders.payment_flag    COMMENT     i   COMMENT ON COLUMN public.ticket_orders.payment_flag IS 'TRUE -> Payment Done
FALSE -> Payment not Done';
          public          postgres    false    206            �            1259    25995    ticket_orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ticket_orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.ticket_orders_order_id_seq;
       public          postgres    false    206            �           0    0    ticket_orders_order_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.ticket_orders_order_id_seq OWNED BY public.ticket_orders.order_id;
          public          postgres    false    205            �            1259    26012    ticket_payments    TABLE     �  CREATE TABLE public.ticket_payments (
    payment_id integer NOT NULL,
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    number_of_tickets integer NOT NULL,
    total_price real NOT NULL,
    credit_card_number character varying(20) NOT NULL,
    address character varying(200),
    payment_date timestamp without time zone DEFAULT now() NOT NULL,
    updated_date timestamp without time zone DEFAULT now()
);
 #   DROP TABLE public.ticket_payments;
       public         heap    postgres    false            �            1259    26010    ticket_payments_payment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ticket_payments_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.ticket_payments_payment_id_seq;
       public          postgres    false    208            �           0    0    ticket_payments_payment_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.ticket_payments_payment_id_seq OWNED BY public.ticket_payments.payment_id;
          public          postgres    false    207            �            1259    25637    users    TABLE     �  CREATE TABLE public.users (
    user_id integer NOT NULL,
    first_name character varying(200) NOT NULL,
    last_name character varying(200) NOT NULL,
    email_id character varying(200) NOT NULL,
    account_password character varying NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    updated_date timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �           0    0    TABLE users    COMMENT     �   COMMENT ON TABLE public.users IS 'INSERT INTO users (first_name, last_name, email_id, account_password) VALUES (''Ashutosh'', ''Wadhvekar'', ''awadhvekar@gmail.com'', ''SportsHunt@123'');

';
          public          postgres    false    203            �           0    0    COLUMN users.user_id    COMMENT     9   COMMENT ON COLUMN public.users.user_id IS 'Primary Key';
          public          postgres    false    203            �            1259    25980    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    203            �           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    204            �           2604    26000    ticket_orders order_id    DEFAULT     �   ALTER TABLE ONLY public.ticket_orders ALTER COLUMN order_id SET DEFAULT nextval('public.ticket_orders_order_id_seq'::regclass);
 E   ALTER TABLE public.ticket_orders ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    206    205    206            �           2604    26015    ticket_payments payment_id    DEFAULT     �   ALTER TABLE ONLY public.ticket_payments ALTER COLUMN payment_id SET DEFAULT nextval('public.ticket_payments_payment_id_seq'::regclass);
 I   ALTER TABLE public.ticket_payments ALTER COLUMN payment_id DROP DEFAULT;
       public          postgres    false    207    208    208            �           2604    25982    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    204    203            �          0    43455    divvy_stations_realtime_status 
   TABLE DATA           7  COPY public.divvy_stations_realtime_status (altitude, availablebikes, availabledocks, city, id, is_renting, kiosktype, landmark, lastcommunicationtime, latitude, location, longitude, postalcode, staddress1, staddress2, stationname, status, statuskey, statusvalue, teststation, totaldocks, where_is) FROM stdin;
    public          postgres    false    214   [6       �          0    42745    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    210   ��       �          0    25997    ticket_orders 
   TABLE DATA           �   COPY public.ticket_orders (order_id, user_id, event_id, event_name, ticket_price, updated_date, ticketmaster_event_id, order_sports_name, order_city, order_date, payment_flag) FROM stdin;
    public          postgres    false    206   ��       �          0    26012    ticket_payments 
   TABLE DATA           �   COPY public.ticket_payments (payment_id, order_id, user_id, number_of_tickets, total_price, credit_card_number, address, payment_date, updated_date) FROM stdin;
    public          postgres    false    208   G�       �          0    25637    users 
   TABLE DATA           w   COPY public.users (user_id, first_name, last_name, email_id, account_password, created_date, updated_date) FROM stdin;
    public          postgres    false    203   �       �           0    0    ticket_orders_order_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.ticket_orders_order_id_seq', 19, true);
          public          postgres    false    205            �           0    0    ticket_payments_payment_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.ticket_payments_payment_id_seq', 13, true);
          public          postgres    false    207            �           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 24, true);
          public          postgres    false    204            �           2606    26002     ticket_orders ticket_orders_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.ticket_orders
    ADD CONSTRAINT ticket_orders_pkey PRIMARY KEY (order_id);
 J   ALTER TABLE ONLY public.ticket_orders DROP CONSTRAINT ticket_orders_pkey;
       public            postgres    false    206            �           2606    26017 $   ticket_payments ticket_payments_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.ticket_payments
    ADD CONSTRAINT ticket_payments_pkey PRIMARY KEY (payment_id);
 N   ALTER TABLE ONLY public.ticket_payments DROP CONSTRAINT ticket_payments_pkey;
       public            postgres    false    208            �           2606    25992    users unique email_id 
   CONSTRAINT     V   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "unique email_id" UNIQUE (email_id);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT "unique email_id";
       public            postgres    false    203            �           2606    25987    users user table PK 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "user table PK" PRIMARY KEY (user_id);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT "user table PK";
       public            postgres    false    203            �           1259    26008    fki_Users_FK_Ticket_orders    INDEX     Y   CREATE INDEX "fki_Users_FK_Ticket_orders" ON public.ticket_orders USING btree (user_id);
 0   DROP INDEX public."fki_Users_FK_Ticket_orders";
       public            postgres    false    206            �           1259    26023    fki_Users_FK_payments    INDEX     V   CREATE INDEX "fki_Users_FK_payments" ON public.ticket_payments USING btree (user_id);
 +   DROP INDEX public."fki_Users_FK_payments";
       public            postgres    false    208            �           1259    26029    fki_orders_FK_payments    INDEX     X   CREATE INDEX "fki_orders_FK_payments" ON public.ticket_payments USING btree (order_id);
 ,   DROP INDEX public."fki_orders_FK_payments";
       public            postgres    false    208            �           2606    26003 $   ticket_orders Users_FK_Ticket_orders    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket_orders
    ADD CONSTRAINT "Users_FK_Ticket_orders" FOREIGN KEY (user_id) REFERENCES public.users(user_id) NOT VALID;
 P   ALTER TABLE ONLY public.ticket_orders DROP CONSTRAINT "Users_FK_Ticket_orders";
       public          postgres    false    3571    206    203            �           2606    26018 !   ticket_payments Users_FK_payments    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket_payments
    ADD CONSTRAINT "Users_FK_payments" FOREIGN KEY (user_id) REFERENCES public.users(user_id) NOT VALID;
 M   ALTER TABLE ONLY public.ticket_payments DROP CONSTRAINT "Users_FK_payments";
       public          postgres    false    203    208    3571            �           2606    26024 "   ticket_payments orders_FK_payments    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket_payments
    ADD CONSTRAINT "orders_FK_payments" FOREIGN KEY (order_id) REFERENCES public.ticket_orders(order_id) NOT VALID;
 N   ALTER TABLE ONLY public.ticket_payments DROP CONSTRAINT "orders_FK_payments";
       public          postgres    false    3574    206    208            �      x���ے7�-���
>�u?�6�/|�%З-�I�#���$�˔��dUI���{2�"���R�Y�K� ���˗�7�}>?|��z|��z�������)F�"��з�����o����0s���������y��"��7�����a�{|z�������?^>|؝>�o��_�ߏ���axC�~yC�B���Ƞ��'D�!$*� 1Li�0)���
��"�`1�${'&���T_R2]Yf7BjJ�������8Y����ߞ���ӂ��7l��3��W*�q�Ec��t�&�%�;��	�&Z%���iBrE;&}��m����������� v��p@��������LH�$�V	+4�ֈ8�l|�W�[1��cl��BWFi���]��O�{�ʟ]�H7��Q�6��� E�mҚ$r1���S�bJS6?%��wr��������/�ǿf��~�|��JκAz�`�(�l��Qo��boda��h�6JY:7JJ#mǨ���߻��0G�5sZG$���	�� �#�eM��;��j�\�s燤���B�f�c�����O�\4}z��\���w0���;�C2��AgKt�z$_��Ծd:"�����0�gL8�����xB?��
���k�4������X��hT� �^��fr隁9���br���i�mc~>?M�˽�����[��m�F��o<P�Fk�� 9��73��r�_c�� +%��1�\ϵ�w<<?O&m�lM��"��lJ��Y�(sN],��Qd�x� ���o�i�� E�av��ç���>�E��˗�{L"��Y�
�0ID��R�yH���Ij��!�o����A��߆���~���Q��@��h4�81z.'�J\��<����V�5�U����M��ӯ�X�����qֵ�4��D������gp��4gɽ�G	��sp@%������xx�����xN��6��`�#2h�����A���f�h+>� ��#� ��.������Y���p|��m�\�F��L[�.��zGK���;�FpJ�Q� �~F�7��f{� ��ݟ��s��MREJSQB$�q�d�m��Qd���7����/��
vs	��(����)�i��d�?�'�������I �aq���Aϝ�d��V��ɳ��q�)�s?[�hd�w�������~�;����i�c�|<}]0�7Mt�X��'u6Q�����7E^���;�)-T�Rƌ��J�)��Y���a����_?ﾼMǗ�����m��oh�G9%�i��^_��&�.�sz�?8y��;�ό�!6����� '��g��O�޺��ewzx��`�l/���	 2��CF���Cu�G��X� <�d�TLU5	ʹ�y�rz�s�������i:���5�@�Ǆ�	�բ���|ѽ[�`�x�0VTMk�u�ϻ�}���N�����zkR�?�@�3<x� ���c�[���u��Gs��wY
3�� �����a�~(ͧB�ɨh�T�$�qs=^8󕼂K8�l���W�䨖T�/�P����iL+�|�H�3��iŋ�l#�H���m�9F��m�,}�d�r>�����IV(,B�^|���
q4O	�=��C�֊(Q&���q�%`�v��� IW�0^�mH=�UT���_�_~��ȧvg�NC0Nr�蔲k�$`�D+ɥ+	��vA�,��)�?������t�~�|<�'l����yY6$���v2�z!�P˯��7��N�"X��̡�r&h�%Ӥ�{��px���`L|�cz�}��o.���I�QK�H�����t��
ጯσ.�$��9�� ����IJt���?�~�e�G�j	��w(@d2pȨƸ|�� `�
g�Ց�������d���u/	��w<?�>><�s�;�!� YP,��.|��prM��J]�JB�cc��9�U�_�@:�|�{�����������dp��!9���輖��ðl|�g%>Q��%���Ф�I����Gt�=�����pj�ڃP2���%f�|��u�	�/O��1S�Ou<yCJ�_�s��A���ϻ�π���,jY� �[m�����p�$��� S��֋y��j[cSi�1�ϧ������x������~�}=נC�DI�0�݄ �dd�r�f����$�$"�#ɪs�<e����/#$�^��A=}x�`{�����X
�O��B �^�.���y1a��9���}��f�V@@��v��O���@�op֨$wMٞ�K���c[)G�]��
Zan+,¨�{����~:���9�`~�Nc/���
V���L�Y&j�i��������]��B$�Us���Erq��Z�F�*2W���kF��u�G @P8�R/��=�>�{zи��v���	N���3�*�=U���^�Y�h�x�/c\�<�����M����t_J�V�Cv�&{�v�V������쌄 ���D��N���px9�:�϶:^��e���B����(d�� �P�)Z�l�;����Yv�c]����t�}�g��	�"m0���ܷ� P�T��^� =�-&[Dh��ܘ��������k���4�T��F�
O�)�Y(�������\�R�f��x2�p�s���~]CR���"#;j��c��"�2{�+�AH�3wh��[��׏qO�ٝ}k�V�\�4d�������Ae�����ͩ�:-���,Cn��`�b��{y��̟?�rfM�,<D(8�)p{� ��_��k�D�$��X+5�A�Y������OOkiy��EN-IL�Ay��4	�3Se����.r�	 �O�i���E���ɿ��k!��=�:*5<�	�I鬵p��/B��(�'� kt}��`����v��[Ǵ)�����.�'��4�_"�rN���Z>V��.����M&���`�X�H���|��Ϲ�0$��!�!�2�3x����
���<,2'�%��c��]!�]�-Ǵ�Ml�0�Erx@<y���t5�s���E��kU�C�р���WUV �Ƃ�����c�?��>���u9[fyIY�e��,����z����PC�����"��U���h��	ž�hr)��*baT�sCù���kҁ ���ɠ���9k+4�p��:-���.5��݇���sH^?�f�b޸�L�l:,C���ȵ%]����rq��B �U���Hƺ}��v?�g��
6�{
� ��
� ���f�U�a��� �x�  +�j��լ.���s��a� �D��5����� d�$A W�^��ט�E��ݐ���g/�O_v���a��(���r
cSI٘(iR���5 ��CZ$C@���䢥5��H���� �t��Q�[�����F�C��&�1&�$��.�˖�K��*�|G�h��
�[����5��]��?� �x�}��t�L�!����;��	���i�q��I���^�$��IVuT��)�۟����	��y����q��5I��z�4>/�������Q���Ɉ�~��+����)���s2�Ă��Ë$rY�s�.����R-�[��������5GxN#��� ��X,�E�����sYL�i��.���*6VΛ�A�����N�6ؠ��0vmw�%!VJ¼c�&A1��� ň�Ln�{|<׎����ל��r�o8*VƩT�EP���3T�|��uz���R��o��h�����L�g\����zEK��ɵV}'���$5Ȥ_7k�3oSu��gd%b��+�e���,Ng�
 ����a1A���ʝ�#�����<�����t-7ϊ�3S
L�y©n�q������Z;oEZC&�������Lqk�\�8��dg[|�B֭P�BY����O��W�l5C$�AXB}��(�0�5Zp������:������r�^~wxz����ǧ����2�mO"��ڒ\#3`&�e�6L�J���\w6�h���뵑��̟~?��O�#o��D�� �    �ʍ���p��,A/	!ψ�3_��h��QHJFPϲل��3����s^�8SBxpV��\˕BNoL�p^�H���޳z�;=}.���xz�������]���p�!B����Y�bq
���-VO�2i�c��<�[ޖS�I+���l� ��IW/X���9�<�Aϴ	mU�+�`Բnw_/���[��ɠ�S�
@#��(�#1q:'K�D�L���ͭ�&e�C�FZ���]�����+	���iqj6Z,)גjV�z!��޻��#��/{��a�q���r|.�hU�a4(9�D
֕|�ِ��	�s��HU��5l���P�l&pm2Q�}#��zP�͋1�ni��!&��A�Q������Us��6>�g�y�t�&�����<T��ڮ\�0�z�s���'�o��~z8|ZmP5� � �S���	~s��h�Ze���c9�^օ1H�!1d���8�~��<�O�\D�S���H�ғ��
ѹ��J1�t�Gz��+δ>#��Υ�����[�+x�w��0'�oqI� �O%<*\���Z�o �3u�$�#�xK�ѷ=�!#�HC� |9������]/N�e�O\A�<	��Ӓ�����bD3*��V�8��Ж���!�J_Q��k�^y.3#���7,$A�E�d�Z�<EY9B2�i���_��++��dI��RJ/��.XEz�K��� e�J	�\u%	v���Ʈh��� �*�t"�.`Y��C\��|S�xz+����^��\��!\�4�.�H搨��3� 樇����.e#��8�|�s�����Depz���>�֬Ųh�bb��'�	���z��J�P�ݜ�!ew�f����G@��c���#�� #�L�|CE�n֠8{G�	&j~�U��S��_����޽�� f��ܛ	����v�Ȭ��<@h��	 嘺ռ"��ʇmY��D��Y#9@��X��ȶ�J�I�+���;�\�d׶�w+��6��W��e3�<z�mWR��������8�ojA٬�Op`��<�~�:�R�#���x�jÓI"^jsC���"`�SH�:�+0�\����|��,����8�g�ޓ��_̚��
'��-�'W�2r�o[��m�-,��.)s%vF�+��{Eg�2�G�qA�p�8�x^��T���������j�4;�1)-�E�m �y12T�v��LA}3��� �}��\��Ǉ�/k憎��7
i���Sy;��)�v% z�<p^;�~Gf�
&�ۭu<�%c�5�MwPXIr�d6OS��Ɗ�f��,����.N=�>ح��曂�a��!y�A1(��a��m�r� W�f��t��u�g�z�?� My.�ր|����P	�#\Ⱦ)R8���EQ�^U�e�O��t�/ϻ_׊����D�B82I�M�.e�`���`��8��(�����_��� �+q�*�xPpJ�Mzm�E���/�?r��둹�odB�C�L����{Ku�i#����G.u��oT�/��[��X�2U��칎"y-�@E�lҊx����
��3g|`S�$HKQP��RS��|�+uHI/�L�,κ�aF��<���Eq�c,�)	�d��a��xv���Ln� yUP��R6f����p�G��{��<gQ�R"\�R.���dm�F]�=sC_�;o2�|�?}����i�9����{��B�p!���"4��][����vg�P�g!��v�ȥV�Z��E��Jto�~���C���%i��^��(�dL���nB�JG�BКtkV�#�Ć�ռ˹i9��$^�!���ə
h��.�|6�N� ĥ[��PJR]�Q���x������:�`�aj�2��D��6]�����O.�jQ�`���hA:�6��,F�a����-�����y����+�F���Z�F��ꄸ%[C�����Y�F"��*�t�s�pd\�x���)H�Y�٧u�B��)3�͝�xdF�dMm�H&2A�����ޕ �.td�em�5]Ү%���ſ:�]"�N$��!J*�s%V�hQ�V]�M�Lٵ��
1˻��s*��Dsx+h��j�^D'F�O���$�"*�I�B����.���Od|o�˨������6�.kI�\~�\�LK���O���ƪP�Wc��VQ:���5k:w�PH�z7�u�xzB)��$|mQ�<�gҔ��!���(vb]�`m��C܄�SY$d�&y��������m��"Nc��Q����XX��鲐�H|�y9$�7BRLu��7V�QB����&����D��� �F�˅��LRjQS
��M.qY�T��UF����B��2��������O���) W�.���LJ�%�a���
�,�P,����Ezqu�����/�;�V��32�J��8t�� n�_�Q�a�&,��l���d�Ot���n��D@^j\���H9ER����~Rf���U�nau����<i7ƌJ�F�df��Qtɳ��Y<�E9)���i��֍�R%�o�����C�o������}5��2k�&�����=��s�cZԔʣK�e�ɪ�>���6-
Z�L��󏯟��L��E�0+�� ��cg���Ѫ`�f���R��d΍�z�g�5@%��4DS�H�*^�\b����M|�,,Ud����g`�K��~��p�&�ŭv&4�	���F��pR�U��蔧%��V%�[KJ�]�45_�����p���'�D��?O�A��I���q>!7�	��1���Q�<}~���&x@�]i9I���=I8�IyAS+��Z��u�լ��JmWV��UܭF�sAb	Fd�4�C����>]��� ���l|[�]�ݫv�e��%l��8A&���E���e&[޶��|'����u]��@��3}�.� ԙ�e��ƶ�����.�J��=���i^����x�����Tt5���dYѕ7H��*]Kh��,5Φ�<~�o�
m�:f�m�@m��+�=�,,etL;U��t������dd=V�H�up�w�~��55$�'����F�g4�r�BR��pi&I�P�=��=F�a��`����� ���0����N����6�#ST��&IG�σ���I�pVw�_7��u�������:	$@�ױC���RS81� �ev�,���a�!��+�|�?� *����|uA�d�$9і,��ѭr�c�>�o؆��gC!��'/B�>8+�ƵT:�������g�F<�آ��1@����\�����)���Lc�8�If������R�_�Ϗ
)�u-��uQ�E�]���W[�!ɍ
�bj�+�<��\�T�()��U�|�q�0Gߝ����/�Wƫ�ވ�J�qg�h"	12Y%�.j/!�;��5��H�Ow1ҹ֏	 �?��ܝ�+��l�`���Ys�¡y�$)�*}�����m=��������ůk8~5Q �v�˩��a�
kc9�P�E���)k�Y!Iu�6]��v�z?�����,�I=Co\!qS޸�8{��d��Gӝ��W�~���}�l!Q��M�g8T{�����
K:��,��f^I�m�0-j���gR�0]����U�vJ���J#�+���yj�V�wnH���e�?��<�'�����۟w_�tj�����j��!r�������X4�R����bKS�qhӶZB����Q���qР N�:���!2y	����^���u2Չ1az�>~z�]6d��)�vrH"���$WpsL�8M���aYl���7�r��.�4,���i���"Yʹ֨9�X�������nd��kV�/_�����4Wi�#�6�)�QH�L��,�tYY��ABT�!�Uv����n�x|u�����z�r�S��XM�C�'uib�6m]m9c��8����Yھu�Q��|x�m�8���L����'(�n&��A�[�{��M����ʞm;8%��6��.��ӆ� cs	]�#g,��n�פx��T[�5@R
VM5����.ojvTk�5sY���8<���    	;d�[���O�ٛ�*y�HL�iI3��������޸Qg˔����Ql	�f��:W�mVrf�<� '+����)Gy'ׄ�e�)Z9E�T]nh=����O�����@�A�V�YJ���h�QkYħ/��Z�2���o�����g�pz�xߕ�N����"�@��.�n��2�IL��E|j�d��ޟS���$}�1gĒ�&L�ȉ�.1z�B�*0߲�ϴ��\zBY���cH��{m���������+����")�u�Q�=5�Qk;�%?k�pY6i����m�o����삛<D�<x�}����i7Od���u�r�M�ܢ��Z�&���� �"��	��� �7om��H$HS��u5�R�w*�S/<`r��:��2�)1��X��U����b�f*T�������n�"�����x����'�$!И��n�XA�(�%s�Ř���j����O�~~�U��lVl�!o�V�X+#W�'�T}Y7���FԄ)��=���auuo�y: ��ҳ)�u xl�a�nV���L�¢�@�QW2t}�YF!(���SU\��8�J�9v]���;;�)i�nTv!*��ۋ��F�{�_7�Mɥ��Љ<z�"��^-u�%¢�&��;��\�Ƚ"�k��d@��+bv6�ZW�Θ��(�/��v���>�=E2�z���H�����y�%
��(r�wMN�0��Ah]leZY"��+�	�O����́t�7�ՙ0�kAE�j]�)8^�ZW��ZWV�Z��u������E���)�X���r�d���
���۷�I76e���g0]��3lj�cL��?����� �W�_��}�WB��.�㌅���Jj����g1ӨRHFxs嶲��Ң�դ�5q�p��j�}B�Y��������6��mp��V(U��r��Z����0 �!�@�Ճ?}����z���P���1��o�d�94�h)8�BdvV��+5�m�����f>E͛ڻ��:&��]Z���N2۞S�kt5u����x��8��?��+/ �~g��Qi���&#��I$�Qβ�Jej��f#*��^�yxض�z�~\����/�(��w��B�N���22�����7  �߿�݊w)�M�PI���'ުX>��:cVj��7���W&	�x_�ϫ>�� ^ƣj��Ӥ �����"5+�@�,�i��Z���o������e7���r��׮]�Q�q#�̘<�y�Ь�(o	�����Lw5e�Փw�>�Ѥ 1�o|l�睏NpZ�=v����Τ�7��J���m�]l�Q��`�6S�?r�C@@QL,@��&���QY��&����{U�r4�ݪ�o~�8�x9�k+�1ALb��_P�:ɬG��M��K\�d�x���?�h��J�	H��u�D�O�,/fQ�b�j?����p�-��M�ι�1Xʞ�o�$n����]94�(5�����q�f�q�0�s�6�x�ǳ�u �u̲�1pH�Ż�㦋c�&\V�iۨ��� fa͆�M8j� ��Ȥ���`XJ-z{�Ɛ�qAT��R�,�v[�ޚ��Ѧ։p���cn��.�:�|��b#%0�n��2�<3��weV_M�	�z��&�� �� �ج�X�C����E��]o���uw@/_>�<M({�@S�
̉�@�ɺ�Re�w��$-s�Uq1}��Z"o��������r㨁��\��Zp�y��)��Z*r�g��䲴��[.�������!���ƆmC�Ȗ��	�+[&e
�&3�%Uvڦ.���+6
%�M��uB���F5г��K3r�{R �E��I�!��,�!��Ao�Y�E��y��)��>�P��Sz--ʢ��%�f=b���)U��X�H��}:U�G-�9H��ʯ7Q[u�O��ClQSl�}ˋ��5O�3�x���e��P�8��2!�3�������j�?en0�Z D�%��*wv�t1A�y���� �9
�Ҙ��6��Qr)h��a_�?V*hl��iNxP���<�l��O�A\2�R����Mw���R�=uY<ߟvH��.`w�$O�H���/F	a����Q2�-t�˲#k�r�y�Զ� $z�������q�M�n����E��,9�ؚ̀��k2e
�y�Y��;vf�ǝ>~�ox@zbcdȇ��ѐ=��������F�sN�z�PȾ���W������q"�!��\�����RĎ7Ximr�&�b��R+Y#m�X,沋z���r��|���5�S�*fw7�
B남Y��F\��|]��2��A�u<}ٝ�c�n_�9D��"�sosI_4�r��`Ȗ��F�+��fB�@�-�m��M�إ���~��n_�����,Zc���ۭ�#���MY��6��oկk�Rp�~G�8�����m�&�&$��<�lo4��nn��ݠ�ф��
�nP�!�f@dR>�<6�BlQ�m�1^(�����u�Ѿ���xx~�F���,���H��w�d��5܅.bo�Zuh�u�-C{ҐɍN�����\�WJ�Ӂ
�?8y��,���i�����[�-AmuTj�8�>����}����ؚ��>���k -��~!�����]���#���[������=[Sw�c��Mِ�	ܗQ����ڝZ�	K���w�����~�����J/�;�up�\(�u!�����[]J����.��ʐ�aq�_�[8����,���'������5Ț��Ö��ƈ���Tښ��5ߤr�m�o[@�I#����P!I��,[T�ز�
\�c2��Yb��|Äu<�|�r{K���ٌ{�`ϓRpP��yh�EA4�0��o�7b�t�J���Ǐ��9钾���׆��Cn��d8�NKwq�8�(�6M�f`G�fR��j����U�[�US��ORg�I�B8^�I�6��eA�Q��<׏�P7�.�|��mZvҔZf������������l�[�CC,t�����j7�a��9���o�ǧ{ DD�xȎB^��qW1W�QM9U���F/�e��@ӕb���|�`����I����E9�h��K�J�V�-e{[aj�ⶇ nڭ�|��o�u!9�� ��,E�uVqXTECM<�,{���%��Nǧ�<��ɁJN�c��
n��S5e]xQm�d��Vp]o僌�������ǻ�@F�|T���8'4jG��S{�[�D�gR	�ѪQ�I��5D��lQ�-�>M�p��@]Y�+��eE4(�L�S7rRtg7~��?=|�=�����p�ښ�!@��x�S��,�6E��2i���&�,����P��I����O�?��~���D���_p�r����9�˖�ƕ4"/T���v����}y������L!yH��ģ�`��e�-ò�Y9ª�� �RdR�x��]�DCp�P9]>�!�J)iO��E}0O��D�؍�����9?~����F ��V'o�bqBA�Y���q(��E@Z	���׷Va��j�.��Is���	���ߚ+I^ԡ�X���q�m��U!�������o��8��'�e��m7޾沆���ಥ��)��(&~�L��)�_$%P|VHΈ�){#�����O����mq���v�>p���,̿"�R )S�EA�i�K�R�l2��3���y�����"{�Y7�z� -�O�P�E��U���`� *@^Vyj��ʞ�݀�e��etEX �� �ѕ x�{m>>Hkjh���"��%�;Wb�m7��}D�3\�`�G�ਨnK�e=4��Ǽ/���1BwE���Ǘ�ǯO��S.WI������ Z��y�X���F�,U��Fx�w�W����Wχ�0/��3
R�i��Ŭy��(�F42��~�ꬄ�SGA��O��ʿ^Qg�����6�ŜV�H�tT�S�q'���¦�qqq����Ի��w��� $���<������\��6q�2�(PŢ^A��_���%Ѵ��"2#�3����Pll�9a��'���.    l(wl�e%�I���m��=��pW?v��ݝ���,�2�ɞ����Ы����'[�C���Q����}C�>���1������X�4���SCJu{$�-k��Qb+�)r#�����[�&�-o��Ȯ�S9W 0!o�2��E��iM��X$������K�����cRo��e���qko��f� S�����wK�#W��H��Rx��~\pf"DFp���]�J�)�&�K��!S/*F�M7�xx|�|:�~Y#�'��};Z�@51�F6����gS�!w-*��m�E���Iҝ��)�lM�PR1�0;#��še=�~��<��Y�W�&�e��M��#8�?���e���׎
�MT块!�SSȗ�i֡�n �y������������VP$M�&♀���ձ�U����[Y�:n.Υ~]K�iɺ#�s ����~P8$�ؠ�d��*r(�n�d��i��Oȹ	Ȱ�^'�;���>,�C�O���Ye�/�����c|E�y��W��8ãrWSXJ�!�X�$�$���-�9�K���	 �+)(����M�����</��Y7mY��`>��l>���h#{�����_��[WZ554����,�mE��h��<�E�:L�Z�����%L�c_4��U#�1�A''H��?٘
�T<�E����7�F�I��Ҭ������;~��t��K�NR^����)�u�ǲR}g� |� ~�|��:��U�Js��H�5�\�����!]��l�	[���6�*��j�G�=�t��t��c�|��tX{��e9���PN�#�b��#��O�'Ę5�M������rJ����o#���KS,�/��&	��]���+�H���l޴��9����TaG��m�� �NX?�s��p���&�hf�"o��d�
�7*U�t��k�ۉ�rJM��Aϳv*�<J�.��fH��	�1���7`�*D���w��!��א��zDSWL*�5U4�
BQt4�r\3'���vU4��f"�,�.7��O��CFH<��$�N�H<FvyS3g����Ԣ�r `�����	Ǻ@{{f�X�)w֜f"J����,�6�ܧ�?|�޽�D��Uk&���4��^Е��?��%,Z�H��d�R��-+�����7����1�-O�ϧ����SB�Q�z���a9�Y/Z�E#�h"(�jʊR[G��Ye��ѥ��d�A�QK����YF�?2��|B�������tbӄBS��j,��I��{
��b�,�q��&�{��r���<Ռ����.�c~:[�Hp'�w9M3
�n,K�:۩-+��(�Y�U���Ώ��;&��mBM��H��D�&!�(�.ɵ�9���5�&��,)ƨj6S���<��"�`�0�Ǹ7ܵ����,K�	D�yz���vwT-�;��p�h��B �j0D�PR\�Em�FT����Gf3ͫ�����朳n���I�#���^^E�m]Ԇo䠅�'��~��7�ڛ�F��:x1�gfC��u-ӱ��Ң6ڸ��< H��i���'�J庍{��U� 9�.��&��F�G�f��g&�(�pq>$T����/ٚ���&�G*���搱�&��x��ohm�e��k
 ]UhlY�bf��b�o<\�g���ɕM���(�6��f-	<�x(nܮUSqK;`_�mw�\��,�tg�ј�����U�C�U���Y�2���+�!����g�۵E����B���i����h�
1�2$���Tg
5*�ǵ���r5߷���c g�T^KBY��۲�e֦��yȂ2Z�]�P�M�d\8>~<������O�	HI���g`�$w9�9Z��+�o˨�VoAx��-��*���×5��� 
<���<�TҨ+.n3�g}�(?�B�[O��\����?�:j$��p�8��$O8�(�mG�2B�rv�*H+5�� ල'T�X�կ��p4�QC�f�$�ăaWg.KH��i���g�䫬��
�,*�??��[b�H{��1a�6p#��C1([t�U���a�������]����?���.�� �	�y��$���Ip���f�|VD�/J�V�+i����w�����i\!''>du��>�l�tYΎ�Ny�E�k��}Rt�Tgg�i�eO��Fe��,q~�:,�E���.k5HM��UzfRB��h'�Ar�2�˦�"˖GT�����#�o|����M�װ��b	qR�(���9�`o�}�9IzY�n�?��Y(?[]<�M$i�Ys�%��+����̟1�{W�'�e);;n��K���sb�ҳ�|G������	d�T�dMU���q�^�����E֥�Ȓ�X�ȯ{��N�/�S��F���[˼���V�� �em�K�?5���|��y�ˤ��JUⶢ|����y��	���^�����NBx�^��7�F�r��.O����B�N߁#B1p��Fk�	NIPY8p:{Hk�|�N�qf�|u>�����-�D}�IP�'��c.mxQ�+ _�C,�s��>�d4�v�絺��UM<�� 	^AQIR(ekLa�
!Lʜ-iD=�"E�'����qu�h3�^�h4M�H�5��� EԀ���cD�:���1�f߰�А�`?�y��%�D�l�E��<�Is���|����������0�m�*���X�D��
+^��RT��a)��j� �;w^�r}�2�L��1��X�`�GH��{�D�����U�g��Z�K�n�x&��yw:��[�y�\�� '���>�/6nΤ���jE�s�DS׉���g�����g�uGJ�ta����Q�jnE�k�v`3��(�4�GV�^��G�~<��Um��4h�E���q`�=�����T+f*�0��'7�[�F�Os���6��P.��e��%w�\P�_��Izz����U͑��q�σU���]���g���Ldnj[�������ݍJ6���޺�Dd�J�~�ykw[��i� 	E7�qp�y~�]Bዺw�`�TT��%\I�e>v�8i{(�X��S��93>)m�s�|Q�����0HY*+H�)�J_�I?����lMpQ!��4IR��$/�-k��꬇�裞�E����oq�*������ �P.j#J���֭!sΕ���¤W ��u!���x ��OO ���`3����H�L�lܘ'����V���w�}���t5$f��-$���_r�������~�Oߍ�)����}�QR�C^�[��R�V�rqi���zX�I�ݟ8[{p���.� 1X��x�� _-��D���s�Z���jvQZ��3�χ/�<b�N�l�NQ+#� �0]n���z�\���4�(⇛�.��0t���՛����M��2F��(׉
80�<��~c����#���^Xpy��>���m��X��j=p9yQ�K5�rO������<������cEA�������ǻ�S��!��GD��[h
	�Y��/���å�m���Gt)6�A�k�D��;�xV��.Z� A�l$_�,#��A�ͷ�'��ht�M�aQW#炒L�7^�&�nE��l���P�W�G������p�Ց�k�Y���:p��b�i��L1�<G�2~HQ����:gR�;�W�KlM�ǒĹANE&7ޗ|�¬e-�qA$�R�
72W9�2���%���O��[�+�ڑN��t�hg��/��e��W�[Uk��=�,m,�5GJ#�:�q� ���a���web���l��$=��B�nE�儚#{+���n�u5Q�Tjtt ������~3<��ՌI�Q<a���a��ϻ?d��|�9����e������hɭu]k0rK��Wk���u��ʕ�����IF׵���(�Z!M���
�Fu9��u�awx��?g�w����hGT^���e�����T!>,~^t���iE�Wkn�U�7�'D�Ej⼈,$�@Y��PUy�� �΋� �׎tW��(�G�4�z�4L6h�|��.��W8��<"����8|Y��۝��D�08*/�W�	*�+�    cˣY�< ������.%�U��R�sA�`5�L�]J��#���֣��J�s?�Z�*j�9�vak�U|S�$����2�~l��+h5؊���2XQ��)R�6 ��;)��0.]�=�w���/K܀&�4j�9 �<���2e^��UOgQ�����EST	���2]��,��UƠM 4)fPy~�rq��$��XVX�ȳ�B� \\)�.kIc�c"���o�n)��A���[!3V�)pϲ
�؉�n�݄��v{�7�����Jfo5|� ���s8
���B�u�T,�Z����8�&{%�,"�bX^�����Fic&58�d�p�����E�RG��k	5ʺ�����Ds�I��]�Ęj�䡅���d��<��vnjuS"�r$o�-?�Žb���L�^��t�=k1���cy+��!�B��ZpG�s�G�]7������Q�������x������0g�;��^Z�4�M�X�1�j�!3�0�>=L��H[��e]B���2Ύ�� �q��F���ō��C����v��ܢ�Ёp�+p����I&�}W/0]b�N��aś���EeM���{/)`^Z�k�S��fJ��������,ԥ��6#l"l)l�-M+�b� ���Eq�<@���7)B!�	HK��w�������U�ns6�h9`SВ� _��t=��`���к`�Y��)�X=R��������e�N�a���.*��(�x.['�Y�J4U��B����˨jHu�⮛����6��<zn���Ȕd�[�K���OX��kԪ��+���ݥ��k���9�	��q�	�G��>�d��e-�I�ӭ5�W*�[�������zm��<�_�)�Q{se_�������e�X�Q�J�nivnۿw���"���ct�Y �.��j,�(�5I�M_F�jX��.q7�,j���(� <�C���s�RY�L��5F/�	IG��,��/l_C��Gܿy���q�@.��� L;���V��2�ˣ@�U��zA��;Ki�2��{�:��Zb��
~�}�RG�o[�'�������*���Vm��9P��zp8x?\?���Ir���&��U�� y�}7@7f�T{�m8��%L|H��m��* ���%\T^C�9��#���*	���k���z흙�G�ɑ>:e^��@8׎���.jz͜�7%�zR�C����jf#���&S�8Ȋ��Y�H�Ȱ����W
fQ�]��BW�3��@РZ[��18̊�"��S~ޭ��mF礘�Tڔ�0Ȕ�q�h�U���U�<.�-�T�Ox`�H �za]���	����s�r��X+�4ߜ�ı�&W�62UV�(��:`����&����WG��I gz`ߝ��Oy�m+؛P�����c6��� �gi\i�
!��<dm@`�������-/oj��~et0�Sp��,���N(^]iՊ�&����*D�z��UW)�n礮Qm��u�c��`��,��#HbʒN���Hu^��i.ϣ29�,�&��&��'�{�-�,���e\AN&yÇ�C�9ز�]��թ.6ɵ_\�n��]oH� �\�ܲp|���z�kd�)��3���R�9o����a�-8�U�,A�Y��R�v�����D���;�tpFH��}����CM�)����JU���+"!N�^3�mW�v��l��5C�GEI���Os-lcI\�0���E���kp�7�hp�y�N������NY��%�2&��T��$x��$��Ǣ`UI�����\BX�B�d��z��e38;��X�ƒ��nԢ�M�A�(�4�J[�e�k�P��v�fV���z��~`�ri�)�.��m�U�
H�2�!�� �V<A�ҸV�[�pԟg���Ӓ{���v2��5\������ �)��	�p\�K8�Mǵ>c�T����FM��[T����q�YxQiv^
ˊ�k��p�5��z�c��(�
��<��h�*=�pX��ZIƊj�� �����(�,۔b�Y(�~���KYٛ$�N�/)�d�����.`�[����x�����Ž����T9��y�NPj�IJ��	�Ң�xu��LD�DV�5R#I��n��j��|�P�J	#T|�M��h��V��.�����c����,�b�}��i����b�`"�!l��U�p��&��h��h��Wb�I������Ϸ~�����\[�#D܁�ɚH�N�	n��%����UR�p��57��Ӣ�$nDzU��&�S8��O	�4���/v͠�X���<M-��z� \iu��z�wz�䢋�5�O�|`nH������˝bQdhV�LߨD���O�!�=O�0�v~x�sЌ�B��n \�)���+Q��5�HSjx�,�e.����l�U�`�d�9�*?D�kʒ�E]���	).�P72P㊗nӵF||����@"�J�����`U*�"gOjM�����]�8����Ơ;9샃lg��H��,=�]){�
��$��Δ|�,'Y'��hk��"��v������േ|T�ɲ��K��86��+5@~VN2�*�5e��OS�~Bo��?���A�&�h��i�eB�O�P{u�+��z��c��4���������y|�$�?�w���=��f��BI�5�;�X�噹=
y�V<E���Ʌ큽���s9�#!���f����k��em:N��l�Z^��'�]���O����+v�4��2��ڜO�9Ŝ� ���e��Y��*�ǢN���<J�m��q����7��4���i�H��#i�.��̭��jM썬1��+efy��Q$dR�[�'�,���B�
��µ�	�Ћ��.@���Z0@CLE�<Q�מy��^Fn���L���zДB��e� ��t����LH}Y�	ᨅ���w���)��ד!J�"�Y��{&�k)�����2=�펫LI=%L��&�[�wV��r�YҞN�g��y9N��ܡ+��zf�V���<�T�n{8�qq�F�7�^Fj�����Oo���H��0�f�qbY�g�(˝*�y�+i���'��ùY��S~Jk��� Q��
��:\$70kɕo7Kk{tu�F�VȈ��zp�V�{�}6v_�p���LV�:Hժ�e,/�p�{VX�fH
��%��a𳂻�n2�l�n_�E��)�<���:P,�Բ ��}m��q��=b3�伓�!�p6C���NϬZaQ[I�Ɩ�J#9냦�������̝��q�bFN��O!0�p�Q���$?,:f�6
3@]O�����a�����~q.��ˉ(�B1����A�O�p-��Yw@,J�Lz�2�9Ԁ��+�@�����΀\�I�*,pvJ�#�JX%h�P|u�%#W�I�@Fų��,���Q ����k:���_����a�C��??�<=�e:Zu��\J��; 8�����j�XT�!j��YKC]�ٿ��.��;�~	��Pl�]&R���J�Cr>	��A���*>3�n$���@y��<��J/��]^P���8�4�u�kX�{����X��/H��RxN����T�MFZ5����Y K��]nK�l4>\� ��v����*�Ѡ�A;���+�A([�]Jp�
�l[�q��d�I�y`�/��5-�� |bg�����%��Zdx͙ݗDj�D��O�=�$��ބ��X��A��e�yo<�z<��|_���w�W8s���}@q6e���������6���4�*{��r��w˹Ç����U��K�8	A�@ev�蠃J��JW괉e��K���w�F�^�E�ᳮ��}b1�@v�bv�ײ\2HS"�M&��,�/!|�74\�ZO��-fN�`�"S�S"8�a(��s}/w�p�qδ�Ģ���4�z���u��euW��߿~��ܧ����Ji�)�hI� �q�cCi��B��}f=�q"M��#C�F�l�ّm5�Y����ϦI/!nq�����m�`��˃y�����Tj�}�Q��.��bk�LI��\h��6ݢ�ό�9�:<2V�w��#�����    
�������傾qX*%�,�~��g��bY�,@IȪJr�=���$*��\�����;�e���S�ۍa&���!�r��V�}��
�Œs�Y��SI4'���3{p�f�����V�_F�������t�j��PwF�I]S��H��~{P�+���8hj��ŎYg����ǚ,�������	�1	ʵ�jcϏ�N�$M ٓU�3�C��-�������a)�Ȟ�����[�pb7�_����sĥ|^ �\`^ǋ�`3�6n	!cS�`^
��4�?8��Z�E�� R��m4o�f` &��:��K�ɢZPց��*�;Zy%��:>���ƥ;|�=~�lT��2��z�jpQ� ,_�j��ՂfoK�vbd1Է�!Y�+�z{�l (���� �fsH���N�"v�n�3�ے��Hh�}Q��l�a�*v�~�1:�&n�1��h��Ųz�EaKa�9Sp07BR�m�������z<ݷk�)��["��eQIg�*6�lk��E�L�+�� z����?C��b�`�����;�G��@�g���t�j_�1��"������ߚ�&#���)u!���/Vw���x`��b�d�44�
���Z����0z���� /O�׫+N$�t�n2D��q���99�d�����gK �j���N
J-n�ZXRXJ��w�yI��8g,��gGK��jZT�['�b����I4��g]=�����i��g�ڂ�"�b�:�ұuV�շϪ�kB׭<���0j�)~����nqc�+��p�>��9�L���Eg�I�,	�k"B�dj8�FxM�� k�@햞��u��3k�Gk8�.��,C�����X*㱅��ъz�,�έ�.����}�����\_���Q�6b"1�4fʞ����uw��Մ�;Ar�l-`��Gi��^DF){��7��z>�8L�X�)�\�u���;�Oj��(�T���P �����/�v�ΣMBv\G��M����r�{yVk+��m����a��Q���o�π}����~�%�ԥ|q �OW�D�z-
?Ͷ��d�BI�Z��q�=�ʛ g�*��t�=P������ݟw-��`��KbZ ?���§�N�Pk���vzT՝���wq�Aͦ����P�A\�$�����#���	B�W[���c���1����?<|Z_���~��f�$'��-*����)���5�ּb�ԍ�1���xx<7(�rU���y�����%�{��g-�_�,������TD.��Z�q�Q�M��B�u�C�z�	����ϯ�������ɀ�`C~^�k�V�ܼ໨�6�¡�,	��P�!/�����`�&0�,�i�W��k�d��3!�q��5���kM�P�e\u�-����6��N(�5v_�����aE�����ej���	!m�Ɇ栻X�S3g��(�I!c�Z�؞Yʔ���N�"�En��lR�D��`�T�K�ڋv¼(���P]J FBvb���-c�/�5�Y��b�m,�k�h���D�FqZ�+�hYN���b�����E�
�;z�d>����EF����>�v�Ĩv)�+ᤷC��>=$�,k��e1�i+���
R0.���� \پ��������"�O�7p'��h"���vX�UC��;"ή�kY��7�6ls��RoH�F:��Y�<��e߼ �zk���}�$�(�{^����������ű'o�@'��Jz2�-�$�b;Y��YH��U�x�e�0	ne�R-�"�Qd���
�?�?�BD�#���EfY��E�8�b$ye��<R�fkդ��'UW�6|>=<=?���U��=6���Xǉ��\�j�Ǧykz�3�g�R�E�i�-F�}DOgf�1Qxa�
j��Eu�ii��RL@PqU3ڰ!)v�6)�mZ��r<%��}��k`�	�$���4\15d���+�K�~�x<�ʜ&���p {Gs�Aj%��M�XԄ��zy۲PK( �:2�s3��RǏ����)S�c�t�ȿ�>8n�c�m�q�%��q[��K(�����O�-m�p\D�O��:E�	j�y���CS���B6˄l���.�Qݝ ev�E����!���?I5�^�'�wq�����@�7�Jd�l�~�9)=����*��A[��7pM���4[%����W��Ȓ�bϼ/���}}�qrH������$Df��<\�����>.3�e��R��t����b��5�ڛ�d&���y��gN�"�wh��T��^c\ ���ZT��ݑr<���ph�W�D��	Z@�4L*T����U�0xY��b��rn�+�6��c'��=�w~�p��:D�N�@�d݈]!�VWV�|XeQ�oZ@8��k��7���"Ǻ���~;���X 
gz5ӓu�s�Q�����)��~0Xu���`2pW�ܣ ��}I��_����V����y��L �x\( c��V�(�J�	X	U�i���+�r�=��0���O���bd��e��$�I`,�4�4�=$���Kf��l�FL�~P�v#Zv[�%�ضݸy�������OL 1ơ ��r�-J�S<ޏDj[�9��m��n?�F�ֱ!�����k�9���)Nke-x<@T��,�r$qY��H����)p���oJ(
�\������e��e�MW"��Ϋɸ��	Zt���B�X�?7���*/�yny�����9o��� ���D�g���<�]���=����ׅ�	$
ԁ���}��yU����Uy�� ǀ�=��r�x�A�2�B{��XS_$�Hld^�s�%[�$�B�Y��M}�בyN|����Τ�Ц���0^TQ0��d�U���?���kَ�F�{�V��>�7�����O�m��7%����K�H�-}G$����Df1�+YeQ�e �BĽP�5�}E��l~,��#���l �IE����L�hp,��f�pi����6��泹nS֞T�{%�@%��T6:	�J#��<�Y���|� ��x�P������n7�'7"����	�_��xH�Ҷh^��]��
k/:�Hs���l�*SBi��Re�)�����qِ,	%9�D9Cu�,�2d���ȑ�u�j��:�
�ʚ}���??����On_�[(�"����I�8�bEt<�_(�&�c8�'�*
��_�y��H(�l�^/p�û�֙ ǝO���N^K1��"�mq�E��\�S7��p����'��c]SK���#ܯ��&���&�?%���@}��1��G��~�X��$�G*e����+�����^�m��dʄA9"׮QV�EZ(na��98EM����t�)>Y&���p؟6&��A�4##JTo����,A�e�h�ϱ�C>ƱZ%S�V���֖z:p�HV��� ���,�i�X���yˆ����?�+=T�=����Z�����b�+�qp�䰢�%��0+�)	7'5%Q�W1��Z�~w�(��*TAouq>�ﱻ1\�ӧ��F`����(t͒8�(ڎS��÷X��T�q���+�U�-5dǢy�����xx�t��l�1HV����I�,q���g�IN,�p����1#��Ѫf��;)��fzr�~:�þ8��󙈥��tF��)�!\�u���1��<yd���ո�ߊu�F�fTQ����eT*Z�9���L!�#Y9'7��
� 
�}S
&kb�/�m���4D$���.T2�r�J6���1s^�ބwT*B��&0�S�fO�|YrT�|��u��o\`)f�A \�v����{:3�~�Լ�2���Ǫ<��V�-U��8Mœ�P�/���q�������O���&夛��mk&��ҒO��D �M���/S"j���yK��D�

�f�� ����K�z�:���@��2��P׌5��:��R���0ͷY|xܟ�잎��y�r���BE0�DBgu5��ؑ��p);�b���^�*�"�9����pw|:sܤ�i�����X���B&YgC�"͏.�E�C����i8pՄ��Mv�^�����<qsۡ��B)$�p�t�"����sp�4�S'X    =@oD3�w�ǒU~�����P�DET�Á�#��!%VY3� ����.�uW^B%���3�TZ&�y�^�_�����a追x1!�a��XCۉ�_������ �I�9�>?>"�onu���G����Ԡ��"�-L�Y�(�y&[Uz�Rʮ�|R�c�4�=[H��9��m���y��9�,�s�b���{�]͗��7ϖ�wM�Iox�<�"��x���s�զ6�A�t���M>b6��2#��D��3eU���Zd1��?e[�e�d�1�z�-��?s��
�T8*�������f� �7[���n:��l�6��p.x�����hLsWg���l���1?��P�_w�ݧ�A���?��M�ix�?*lrf���4��}ޙ��L�W�@i%���Mds<m��_e��$jL�9�;���\Y�f1[PH41�|�����ビسU��[��PeI��ZȬxӟ��I�\@+;(&��j��P�"@�Jd�E�f9�v�`���E�+ǦL3��aw:��Lw�<�ϻ�#.e8�E�NMϋ偻��OqFk<���L���ų�q�@&�0Ff9�bR�2E7y�Xc�+���dV���������X�x�h�`F ��w�u���F==o73��N���C���[���Yo�r;�\�1y��<kB�c0U��:��6�$�ަ-=/W'p;K�q���.��h�{\e� R�&���Rn����w[���Y�3��hA�w��撝5��"فϫ�G���M����U�$k3 ����Cj��*V)�ƄGQS�B�Z�7%�`���GHǼ����v�Ib�Oy����!��{r�Q�ƣ�jyO��#�	���چ�y�#���X��+l$t�L�CG�Bn�C��a���Vc��0%�S�,�iq�Y���)$��ȧ�;{mZS]b�U�N��&��
�<2��i��,+R�)��ƶ��x9SQj�}�f�3	������<�� �08���EG���&i�2����AB���B��AI!�
�@��MIX�t�Q��Nf)��2�^�%P��)�jᱏ�o�C�my"y�*#B-.ģ�.�2�^�(�ê����8}�=�D�q��W'f|���
��GZ�IٽƷ���b3�n�J��k�qJ�i��#�pm�렞�"mQ8���̷��x�.u��R���j�s�� 4|����[dr:�6)�֠dp���2�^i�NӚjT�f�����8	�Q�YR695h�	%!K ���Lr�E��
�'o2�L���w���0I�b�H����A�8�U�Z5N�J�@F��N��YUH��d`��ܽ��F�n����	��`���%>������s^�DJٮ���R7��賮8�פс�4d �����P7W�,S�o6YGk�+.������u���N�Q��+dYσ��:�eЗ�-29fk�
d*3Wj((���C�x:?�C&��J~�0!��|t�B�VQ�.5n���=x(����L������D��n�8X�2�'�3W?-״����L#�{b���ȷݠ�G�C�g�7�]�g�U�D�eB��A/
�1�-矇WY�.J��V�*dKn��mww?��WA��ka9�L���UH<@vpa�������]��T�:�I�s��ܠG6[�u��D��wp�6pn/Dx�p�H��S=fT�*��g靦>��]o����`� Y!�.�w&�m��njFt��8Ś��mE��;M�aiPT���]��w�Dw0ʰZIr�|�:���UT@q���a��fɍ�F�"���l�M��i������t-�=5ͺ���v�2z°��ϙ�sYAW8�"�,r�MMï�$�MP�f����B	9���(�N����h7��2c]����X���B��IM�"�<�+��Q7�'���C���u���[�y��D���	����u�A�6���r���Q9&8i
7������Z�2���zT��D$Y��Y�A�&F��i���C��ŕ�����T�*�����3�)+��>��^2��?1#�"��F}D�yf:�|��_v�3K4yD��$"�Χ�����Q�vѬ��&�4����O�W�%:�&B�H�����O��2]6� FU��,�yg�>����m"*&h�<\}��h�o��L2�2��ɰȠ
��PxS����1)���|3c� �tI�P&y�2���u5�T+�L�6(B�>���@a�D������y�+��{�H��zjvj�R�6]��R���c>&퐀��n�YV@����ƒ�ʍF�>��$�^�SҺ��L��s�%���Z{��������y,����g 5��M�eD� e�2�����Q�z����A�����/F
���5f�T�Fc]t`2er�B�6t=ָ��ϑ��=->����������p���uh�ʅ3i�.Y"<��>����hT5���Mʉ���������	�=-86��^�Vp!IdsAh�������QgѬ���ӧ���~|�ۊP�tZ#�K�-��F�Tsl.]�ū ��>R49A�ӶM01����h�1dp��i�ܝe��p)�~�в��4���j[�Q�x��z0�ӆ� ����j��+pN��;��7���y�y��O�l���*��&��2�]Y$pƫ�j�/�� Y؈����k�uVI��w�R'�Vr��>��t��9�_J�ouԐ@�'1#�^
���Tnz��f

�\�XS��2O����?��,�p�]��`���g�|���a7�p`+�� �hz�:�َIvjl�ΘBppݕ���&�zkv���>E.��PӦ������������篇mD�>�ɎЁ��@������[h��O�X=Lىf����;	}17�lҸ׈�Ќ����PN�)9��2�]�Wµ&���t����^��cP�����@9ȌZyq���e
���I���0�6������:�Y�'1��&F�Oұ��&e�2���i�Sǹn2�}�;<>��<�Y�8 ��iĸ�ccktj����Lҡ���]+���l��K��6
.)��R���� o )��pV2�KTE���X$�Y�4m��� EZnĆ5h���K�j��HQ7���N.ה��6�9�
�������Owkpf)E���t�u2/m#9,
E^H&�)�u��%�aT\Ij�d͚FUTM �����2P�M�ZԳE�"�:+��W@�/,sԕ�(�*q�^k>|*>�8���p+I��q=r������u�"+�YS�F�J�	eX[O���nx������n����z��χݟ���u���	�%�0.��,��\��4&�Bw�գTF�f8ߏ̈́�W�C���*"�S��4O>$��GU�o� G2a��4�A�C��~������s�m���!��N��S 3$r�t��sq@T�ek��_�_o��?�>�d��8S��(�	£�f���U¹��A�\���w���+�_����p��G�uPف��dV�L.3�M!�m��������?��{Z���H�=�	�m�e׏��9���+�[�=z��/7E�(ƛ��)��6�.@�pܟ��+��b��z9>r���B&Jk�CEU3Q��yo&�o�Kh�����b�DQl�o��%���$����50%�M��;��:�%����)���_���O�/6�D �K�y�\1M�*χ��=|]��oخ�N�G��ƠȻ���~?�-�m���x��)��	j:+����>9O���j;5ךV;��V�jy/H���W���xz�����A�(��}��^�C�Q^�Z{;��qr�E��|��������FF���I>'��L��K����Ę�zb��	k�<ϰ�-i��CiӠ�w�w`�|�~X����D���D{j��M�
�O�{4�o���5h!���9�#��u�o
�a��sO��"E�!S&bHUSL�A�2])�Z��ˤ5�@"�I������s@I���;���q�ex� ǣ9J�%ҝ��C�.K Jװ6G��$J��� �   eͷ����BU1H�~��M��B�%��g�$.�U��OK8e��HZ��N}K���X�L��m2%��;<~\���%߆.���׆:U�wi^#Y������5Y [잾ߝ�zj�AJ�Yw��B�d�9]M�*���A�_��we�n�d��;�����/f��P�Λ�f=-�"�\v�Z.Sm�ޥ�c���)|�V$M��ӻ���C����3d��5�6�e��pq;`Z0X�=G���o��7��D      �      x������ � �      �   �  x����n�0E��W�Lp8|��Nh61P�P�Q�֢���KE��EpEb�9C��ᎄ.�+
��_p� M�{���X���sH��6�㻾�Cdu|�bVuz�)C�Z��p�s�[�X�P��ʃd�1n
(&��Ѝ�8:�s��) N ���(GD�^Y�$J#��r�(��M���ܠ��:n��O�q��w�S�_�u
�>��]��&�!EzӜ�X���2"���1F�#]K�]���ϕ�j�"7e��M�/Z#�fj�^�; =�BϳP��1����afj�疡�J�9��5�A�y�wQ(�x��Z>���/5�{�?���nw���}���OMC�C���C�>PL.��-|�������Yǘ^��s. {���(��7�p�      �   �   x����nC1Eg���@,.l��7�T�L����&k����GW\'�@J���1f�c������ϝTT�ү�X&�R����w֌Sf��cy6��q��\�C��@�ׄ!T��{�/����������nKf�1=|�e���EJ������m�F����<Se	���[ї�?3��}v      �   A  x����N�0Ek�+�c��qlW�hX$�����f�$L2AY@�=A��Bc=���XWFq�d][5�x��5=�Z��a�ʐjW�������;�[$������̊��$��ioB��(�0����=���U��64�[U�cV{�^�0Ʈ ɓ�FZjh����X����4<jx��R3k�F �'���ZgW�4�F�=h�R��,��k�� ��$�5i����K�=X���1�
�D���V\�C؇"���?���b�Jf��et��$iq��2������Þrq�vb3�?x�!D�C��.���G%�� Ycߘ     