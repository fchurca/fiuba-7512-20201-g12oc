function c_p = condicion_problema(P1, P2, alpha, beta, m, n)
  s_0 = serie(P1, P2, alpha, beta, m, n);
  function table = c_p_k(seed, k)
    x = [alpha, beta];
    c_p_t = [];
    table = [];
    i = 1;
    d_i = [0, 0];
    d_i(k) = seed;
    c_p_i = 0;
    d_x = NaN;
    df_dx = NaN;
    do
      d_i /= 10;
      d_x_i = x .* d_i;
      x_i = x + d_x_i;
      c_p = c_p_i;
      s_i = serie(P1, P2, x_i(1), x_i(2), m, n);
      df_dx_i = ((s_i - s_0)/d_x_i(k));
      if (isnan(df_dx) || (df_dx_i != 0))
        df_dx = df_dx_i;
        d_x = d_x_i;
      end
      c_p_i = abs((df_dx * (x(k)))/s_0);
      table = [table;d_x(k),df_dx,c_p_i];
      c_p_t = [c_p_t; c_p_i];
      i++;
    until (df_dx_i == 0)
  end
  plotsize = [2, 2];
  function newplot(pos, newtable, newtitle)
    subplot(plotsize(1), plotsize(2), pos)
    plot(newtable(:,3), "*")
    title(newtitle)
    ylabel("~C_P")
    xlabel("i\nd = 10^{(-i)}")
    grid
  end
  function disptable(newtable, var, direction)
    disp(["C_p para ", var, " por ", direction])
    disp(["d_", var, "\td_f/d_", var, "\t\tC_p"])
    disp(newtable)
  end
  format short e
  table_a_i = c_p_k(-1, 1);
  cpai = table_a_i(end, end);
  disptable(table_a_i, "alpha", "izquierda")
  newplot(1, table_a_i, "C_{p a^-}")
  table_a_d = c_p_k(1, 1);
  cpad = table_a_d(end, end);
  disptable(table_a_d, "alpha", "derecha")
  newplot(2, table_a_d, "C_{p a^+}")
  table_b_i = c_p_k(-1, 2);
  cpbi = table_b_i(end, end);
  disptable(table_b_i, "beta", "izquierda")
  newplot(3, table_b_i, "C_{p b^-}")
  table_b_d = c_p_k(1, 2);
  cpbd = table_b_d(end, end);
  disptable(table_b_d, "beta", "derecha")
  newplot(4, table_b_d, "C_{p b^+}")
  format
  print("c_p.png")
  c_p = norm([cpai, cpad], inf) + norm([cpbi, cpbd], inf);
end
