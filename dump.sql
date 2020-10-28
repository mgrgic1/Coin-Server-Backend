PGDMP     	    '            	    x           CoinDB    13.0    13.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    CoinDB    DATABASE     l   CREATE DATABASE "CoinDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "CoinDB";
                postgres    false            �           0    0    DATABASE "CoinDB"    COMMENT     5   COMMENT ON DATABASE "CoinDB" IS 'database for Coin';
                   postgres    false    3013            �            1259    16395    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100),
    email character varying(100),
    "createdAt" date,
    "updatedAt" date,
    "totalBalance" double precision
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16398    basicUserInfo_id_seq    SEQUENCE     �   CREATE SEQUENCE public."basicUserInfo_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."basicUserInfo_id_seq";
       public          postgres    false    200            �           0    0    basicUserInfo_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."basicUserInfo_id_seq" OWNED BY public.users.id;
          public          postgres    false    201            �            1259    24652    user_expenses    TABLE     F  CREATE TABLE public.user_expenses (
    expense_id integer NOT NULL,
    user_id integer NOT NULL,
    expense_monthly double precision NOT NULL,
    description character varying(200),
    real_amount double precision NOT NULL,
    real_frequency character varying(50) NOT NULL,
    "createdAt" date,
    "updatedAt" date
);
 !   DROP TABLE public.user_expenses;
       public         heap    postgres    false            �            1259    24650    user_expenses_expense_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_expenses_expense_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.user_expenses_expense_id_seq;
       public          postgres    false    205            �           0    0    user_expenses_expense_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.user_expenses_expense_id_seq OWNED BY public.user_expenses.expense_id;
          public          postgres    false    204            �            1259    24612 
   user_goals    TABLE     :  CREATE TABLE public.user_goals (
    goal_id integer NOT NULL,
    user_id integer NOT NULL,
    amount_needed double precision NOT NULL,
    description character varying,
    reach_by_date date NOT NULL,
    progress double precision NOT NULL,
    "createdAt" date,
    "updatedAt" date,
    priority integer
);
    DROP TABLE public.user_goals;
       public         heap    postgres    false            �            1259    24610    user_goals_goal_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_goals_goal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.user_goals_goal_id_seq;
       public          postgres    false    203            �           0    0    user_goals_goal_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.user_goals_goal_id_seq OWNED BY public.user_goals.goal_id;
          public          postgres    false    202            1           2604    24655    user_expenses expense_id    DEFAULT     �   ALTER TABLE ONLY public.user_expenses ALTER COLUMN expense_id SET DEFAULT nextval('public.user_expenses_expense_id_seq'::regclass);
 G   ALTER TABLE public.user_expenses ALTER COLUMN expense_id DROP DEFAULT;
       public          postgres    false    204    205    205            0           2604    24615    user_goals goal_id    DEFAULT     x   ALTER TABLE ONLY public.user_goals ALTER COLUMN goal_id SET DEFAULT nextval('public.user_goals_goal_id_seq'::regclass);
 A   ALTER TABLE public.user_goals ALTER COLUMN goal_id DROP DEFAULT;
       public          postgres    false    202    203    203            /           2604    16400    users id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public."basicUserInfo_id_seq"'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200            �          0    24652    user_expenses 
   TABLE DATA           �   COPY public.user_expenses (expense_id, user_id, expense_monthly, description, real_amount, real_frequency, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    205   �       �          0    24612 
   user_goals 
   TABLE DATA           �   COPY public.user_goals (goal_id, user_id, amount_needed, description, reach_by_date, progress, "createdAt", "updatedAt", priority) FROM stdin;
    public          postgres    false    203   �       �          0    16395    users 
   TABLE DATA           ^   COPY public.users (id, username, email, "createdAt", "updatedAt", "totalBalance") FROM stdin;
    public          postgres    false    200   �       �           0    0    basicUserInfo_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."basicUserInfo_id_seq"', 1, false);
          public          postgres    false    201            �           0    0    user_expenses_expense_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.user_expenses_expense_id_seq', 1, false);
          public          postgres    false    204            �           0    0    user_goals_goal_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.user_goals_goal_id_seq', 1, false);
          public          postgres    false    202            3           2606    16405    users basicUserInfo_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "basicUserInfo_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT "basicUserInfo_pkey";
       public            postgres    false    200            7           2606    24657     user_expenses user_expenses_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_expenses
    ADD CONSTRAINT user_expenses_pkey PRIMARY KEY (expense_id);
 J   ALTER TABLE ONLY public.user_expenses DROP CONSTRAINT user_expenses_pkey;
       public            postgres    false    205            5           2606    24620    user_goals user_goals_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.user_goals
    ADD CONSTRAINT user_goals_pkey PRIMARY KEY (goal_id);
 D   ALTER TABLE ONLY public.user_goals DROP CONSTRAINT user_goals_pkey;
       public            postgres    false    203            �      x������ � �      �      x������ � �      �      x������ � �     