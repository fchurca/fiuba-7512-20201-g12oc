function c_p = condicion_problema(P1, P2, alpha, beta, m, n)
  s_0 = serie(P1, P2, alpha, beta, m, n);
  iters = [];
  c_p_t = [];
  table = [];
  i = 1;
  d_i = 1;
  c_p_i = 0;
  d_a = NaN;
  d_b = NaN;
  df_da = NaN;
  df_db = NaN;
  do
    d_i /= 10;
    d_a_t = alpha * d_i;
    d_b_t = beta * d_i;
    c_p = c_p_i;
    s_a = serie(P1, P2, alpha + d_a_t, beta, m, n);
    df_da_t = ((s_a - s_0)/d_a_t);
    if (isnan(df_da) || (df_da_t != 0))
      df_da = df_da_t;
      d_a = d_a_t;
    end
    s_b = serie(P1, P2, alpha, beta + d_b_t, m, n);
    df_db_t = ((s_b - s_0)/d_b_t);
    if (isnan(df_db) || (df_db_t != 0))
      df_db = df_db_t;
      d_b = d_b_t;
    end
    c_p_i = abs((abs(df_da * alpha) + abs(df_db * beta))/s_0);
    table = [table;d_a,d_b,df_da,df_db,c_p_i];
    c_p_t = [c_p_t; c_p_i];
    iters = [iters; i++];
  until ((df_da_t == 0) && (df_db_t == 0))
  disp("d_a\td_b\td_f/d_a\td_f/d_b\tC_p")
  format short e
  disp(table)
  format
  plot(iters, c_p_t, "*")
  title("Condición de problema")
  ylabel("~C_P")
  xlabel("i\nd = 10^{(-i)}")
  grid
end
